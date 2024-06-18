import {Sortable} from 'stimulus-sortable'

// Connects to data-controller="lesson"
export default class extends Sortable {
  static values = { course: Number }
  onUpdate(event) {
    super.onUpdate(event)
    const newIndex = event.newIndex
    const id = event.item.id
    const courseId = event.courseValue

    fetch(`/admin/courses/${ courseId }/lessons/${ id }/move`,{
      method: 'PATCH',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ position: newIndex, id: id })
    }).then(resp => {
      if (!resp.ok) {
        throw new Error('Network response was not OK!')
      }
      return resp.json()
    }).then(data => {
      console.log(`Success: ${data}`)
    }).catch(e => {
      console.log(`Error: ${e}`);
    })
  }
}
