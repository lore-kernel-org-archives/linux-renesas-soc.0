Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33324 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753437AbcL0LSH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 06:18:07 -0500
Received: by mail-it0-f67.google.com with SMTP id c20so33057623itb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2016 03:18:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481654294-8214-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1481654294-8214-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Dec 2016 12:18:05 +0100
Message-ID: <CAMuHMdUm2jfRDwKueMVP0X64MZGsfLTfh2+0nW5n6s-LSSgNbQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] Fix suspend/resume and race on M2M pipelines
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Tue, Dec 13, 2016 at 7:38 PM, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> The following changes since commit 69973b830859bc6529a7a0468ba0d80ee5117826:
>
>   Linux 4.9 (2016-12-11 11:17:54 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git vsp1/suspend-resume-race
>
> for you to fetch changes up to a952e0103f86d818a444923adeef50fdcb3f70b9:
>
>   media: Catch null pipes on pipeline stop (2016-12-13 16:25:13 +0000)
>
> ----------------------------------------------------------------
> Kieran Bingham (4):
>       v4l: vsp1: Move vsp1_video_setup_pipeline()
>       v4l: vsp1: Refactor video pipeline configuration
>       v4l: vsp1: Use local display lists and remove global pipe->dl
>       media: Catch null pipes on pipeline stop
>
>  drivers/media/media-entity.c             |   2 +
>  drivers/media/platform/vsp1/vsp1_drm.c   |  20 ++---
>  drivers/media/platform/vsp1/vsp1_drv.c   |   4 +
>  drivers/media/platform/vsp1/vsp1_pipe.c  |   1 +
>  drivers/media/platform/vsp1/vsp1_pipe.h  |   4 +-
>  drivers/media/platform/vsp1/vsp1_video.c | 127 +++++++++++++++----------------
>  6 files changed, 79 insertions(+), 79 deletions(-)

This conflicts with your own commit f94c16126bec2da4 ("v4l: vsp1:
Remove redundant context variables"),
in topic/vsp1-pa-improvements-v1-rebased1.

I fixed it up like this:

diff --cc drivers/media/platform/vsp1/vsp1_drm.c
index 9bb7c1a04157223c,bf735e85b59774c3..5227c3404ec0985c
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@@ -500,14 -491,14 +501,14 @@@ void vsp1_du_atomic_flush(struct devic
                        }
                }

-               vsp1_entity_route_setup(entity, pipe, pipe->dl);
 -              vsp1_entity_route_setup(entity, dl);
++              vsp1_entity_route_setup(entity, pipe, dl);

                if (entity->ops->configure) {
-                       entity->ops->configure(entity, pipe, pipe->dl,
+                       entity->ops->configure(entity, pipe, dl,
                                               VSP1_ENTITY_PARAMS_INIT);
-                       entity->ops->configure(entity, pipe, pipe->dl,
+                       entity->ops->configure(entity, pipe, dl,
                                               VSP1_ENTITY_PARAMS_RUNTIME);
-                       entity->ops->configure(entity, pipe, pipe->dl,
+                       entity->ops->configure(entity, pipe, dl,
                                               VSP1_ENTITY_PARAMS_PARTITION);
                }
        }
diff --cc drivers/media/platform/vsp1/vsp1_pipe.h
index 9e108ddcceb6f977,98980c85081fdc60..d2903c14a211419d
--- a/drivers/media/platform/vsp1/vsp1_pipe.h
+++ b/drivers/media/platform/vsp1/vsp1_pipe.h
@@@ -113,11 -108,10 +115,9 @@@ struct vsp1_pipeline

        struct list_head entities;

-       struct vsp1_dl_list *dl;
-
 -      unsigned int div_size;
        unsigned int partitions;
        struct v4l2_rect partition;
 -      unsigned int current_partition;
 +      struct v4l2_rect part_table[VSP1_PIPE_MAX_PARTITIONS];
  };

  void vsp1_pipeline_reset(struct vsp1_pipeline *pipe);
diff --cc drivers/media/platform/vsp1/vsp1_video.c
index 9c798a72d47a618c,d0c84508d7f459ae..1df65edbebfa8d1b
--- a/drivers/media/platform/vsp1/vsp1_video.c
+++ b/drivers/media/platform/vsp1/vsp1_video.c
@@@ -350,9 -355,47 +350,48 @@@ static void vsp1_video_frame_end(struc
        pipe->buffers_ready |= 1 << video->pipe_index;
  }

+ static int vsp1_video_setup_pipeline(struct vsp1_pipeline *pipe,
+                                    struct vsp1_dl_list *dl)
+ {
+       struct vsp1_entity *entity;
+
+       /* Determine this pipelines sizes for image partitioning support. */
+       vsp1_video_pipeline_setup_partitions(pipe);
+
+       if (pipe->uds) {
+               struct vsp1_uds *uds = to_uds(&pipe->uds->subdev);
+
+               /* If a BRU is present in the pipeline before the UDS, the alpha
+                * component doesn't need to be scaled as the BRU output alpha
+                * value is fixed to 255. Otherwise we need to scale the alpha
+                * component only when available at the input RPF.
+                */
+               if (pipe->uds_input->type == VSP1_ENTITY_BRU) {
+                       uds->scale_alpha = false;
+               } else {
+                       struct vsp1_rwpf *rpf =
+                               to_rwpf(&pipe->uds_input->subdev);
+
+                       uds->scale_alpha = rpf->fmtinfo->alpha;
+               }
+       }
+
+       list_for_each_entry(entity, &pipe->entities, list_pipe) {
 -              vsp1_entity_route_setup(entity, dl);
++              vsp1_entity_route_setup(entity, pipe, pipe->dl);
+
+               if (entity->ops->configure)
+                       entity->ops->configure(entity, pipe, dl,
+                                              VSP1_ENTITY_PARAMS_INIT);
+       }
+
+       pipe->configured = true;
+
+       return 0;
+ }
+
  static void vsp1_video_pipeline_run_partition(struct vsp1_pipeline *pipe,
 -                                            struct vsp1_dl_list *dl)
 +                                            struct vsp1_dl_list *dl,
 +                                            unsigned int partition_number)
  {
        struct vsp1_entity *entity;

@@@ -369,10 -413,16 +408,17 @@@ static void vsp1_video_pipeline_run(str
  {
        struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
        struct vsp1_entity *entity;
 +      unsigned int current_partition = 0;
+       struct vsp1_dl_list *dl;
+
+       dl = vsp1_dl_list_get(pipe->output->dlm);
+       if (!dl) {
+               dev_err(vsp1->dev, "Failed to obtain a dl list\n");
+               return;
+       }

-       if (!pipe->dl)
-               pipe->dl = vsp1_dl_list_get(pipe->output->dlm);
+       if (!pipe->configured)
+               vsp1_video_setup_pipeline(pipe, dl);

        /*
         * Start with the runtime parameters as the configure operation can
@@@ -386,13 -436,14 +432,13 @@@
        }

        /* Run the first partition */
-       vsp1_video_pipeline_run_partition(pipe, pipe->dl, current_partition);
 -      pipe->current_partition = 0;
 -      vsp1_video_pipeline_run_partition(pipe, dl);
++      vsp1_video_pipeline_run_partition(pipe, dl, current_partition);

        /* Process consecutive partitions as necessary */
 -      for (pipe->current_partition = 1;
 -           pipe->current_partition < pipe->partitions;
 -           pipe->current_partition++) {
 +      for (current_partition = 1;
 +           current_partition < pipe->partitions;
 +           current_partition++) {
-               struct vsp1_dl_list *dl;
+               struct vsp1_dl_list *child;

                /*
                 * Partition configuration operations will utilise
@@@ -411,8 -462,8 +457,9 @@@
                        break;
                }

-               vsp1_video_pipeline_run_partition(pipe, dl, current_partition);
-               vsp1_dl_list_add_chain(pipe->dl, dl);
 -              vsp1_video_pipeline_run_partition(pipe, child);
++              vsp1_video_pipeline_run_partition(pipe, child,
++                                                current_partition);
+               vsp1_dl_list_add_chain(dl, child);
        }

        /* Complete, and commit the head display list. */

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
