import Sortable from 'stimulus-sortable'

// Connects to data-controller="lesson"
export default class extends Sortable {
  static values = { course: Number }
  onUpdate(e) {
    super.onUpdate(e)
    const newIndex = e.newIndex
    const id = e.item.id
    const courseId = e.courseValue

    fetch(`/admin/courses/${ courseId }/lessons/${ id }/move`,{
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ position: newIndex, id: id})
    })
  }
}
