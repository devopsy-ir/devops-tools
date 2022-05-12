pipelineJob('folder-a/sample_service') {
  triggers {
    bitbucketTriggers {
      pullRequestServerMergedAction("dev")
    }
  }
  authorization {
        permissions('user1', [
            'hudson.model.Item.Build',
            'hudson.model.Item.Cancel',
            'hudson.model.Item.Read'
        ])
  }
  definition {
    cpsScm {
      scm {
        git {
          remote {
            url('https://git.mysite.ir/scm/folder-a/sample_service.git')
            credentials('bitbucket_user')
          }
          branch('*/master')
        }
      }
      lightweight()
    }
  }
}
