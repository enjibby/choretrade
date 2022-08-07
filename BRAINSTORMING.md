# Task Entity Provision in Home Assistant

The basic requirements of task entities:

- Allow a task entity to be set with a `due_at` datetime.
- The task has a `lead` time-frame. When the current time becomes (`due_at` - `lead`), the task `state` is set to "on". e.g. if the task has a 3 hour lead time, then the task becomes due 3 hours before the due date.
- As the `due_at` approaches, show the task in a checklist.
- when the task is `checked`, the task `state` is reset to "off". clear/reset the `due_at` and remove from the checklist.

Each task should be assigned a `schedule`, which defines how the `due_at` is updated:

- an 'ongoing' `schedule` declares that the `due_at` is reset to a set amount of time in the future every time the task is complete e.g. "Drink Water" once per hour, "Open Curtains" once per day, "Vacuum Floors" once per week.
- a 'custom' `schedule` declares that the `due_at` is set by external automations

Task group entities could be used to set multiple task entities as due together:

- A task group has a `due_at` that cascades its value to eack task in the group.
- The task group inherits its `lead` from the maximum `lead` of the tasks in the group.
- All incomplete tasks in the group are listed in the checklist
- When all tasks are complete, the group is also marked complete.

To extend this, additional information could be stored:

- a history of each time a task is complete and who completed it
- provide insight into the value of tasks
- keep a tally of brownie points for individuals
