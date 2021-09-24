# README

Test assessment with refactoring of existing `model.rb`, `controller.rb` and `jquery.js`

## Versions:

**Ruby:** 3.0.0

**Rails:** 6

### Description

Initialized in a context of barebone Rails API to be able to launch and check the assessment solution.

### Changelog

**REST**ful resoures:

```
  root to: 'application#index'

  resources :jobs do
    resources :contact_requests, only: :create
  end
```

Added nested resources for `Job` and `Contact Request` controller.
This action makes an app follow REST principles and construct request URLs this way:`jobs/1/contact_requests`

Next step is permitted params:

```
  def permitted_params
    params.permit(:job_id, :purpose)
  end
```

We are permitting `:job_id` and `:purpose` keys to be filtered and allowed by Rails application

Next thing is strict instance variable declaration and avoiding **N+1** queries:

```
Job.find_by_id(params[:job_id])
```

This request was fired twice: in a controller and concern. We're getting rid of such occurrence with:

```
included do
    before_action :set_current_user, :set_job, :set_purpose, :requires_premium_membership, only: :create
  end
```

Both `:set_job` and `:set_purpose` were triggered once and are available as instance variables inside a controller.
It resolves an issue with multiple initiation like:
```
purpose = params[:purpose]
```

`included` sets required instance variables before any action

Next is resolving useless variable assignments like `@tradesman = current_user` in the controller

Then the invitation mailer was stubbed by fake module which checks argument length and returns true in order to proceed and check failure and success cases.

Regarding the model, mostly all of the methods were taken out of the context but my assumption is that the relations were incorrectly set and I have re-designed the model following the logic of inverse relation.

Looking at `previous_quote` methods, I have added completely abstract solution following my own logic. This should be discussed.