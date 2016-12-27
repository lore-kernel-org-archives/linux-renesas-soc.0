Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:36088 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753384AbcL0L06 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Dec 2016 06:26:58 -0500
Received: by mail-it0-f68.google.com with SMTP id n68so33226959itn.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Dec 2016 03:26:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUm2jfRDwKueMVP0X64MZGsfLTfh2+0nW5n6s-LSSgNbQ@mail.gmail.com>
References: <1481654294-8214-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdUm2jfRDwKueMVP0X64MZGsfLTfh2+0nW5n6s-LSSgNbQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Dec 2016 12:26:56 +0100
Message-ID: <CAMuHMdXuMg+fopdOaEB5-t3WExt-32vDrbsbUXMrktqvEx9suQ@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] Fix suspend/resume and race on M2M pipelines
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 27, 2016 at 12:18 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Dec 13, 2016 at 7:38 PM, Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>
>> The following changes since commit 69973b830859bc6529a7a0468ba0d80ee5117826:
>>
>>   Linux 4.9 (2016-12-11 11:17:54 -0800)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git vsp1/suspend-resume-race
>>
>> for you to fetch changes up to a952e0103f86d818a444923adeef50fdcb3f70b9:
>>
>>   media: Catch null pipes on pipeline stop (2016-12-13 16:25:13 +0000)
>>
>> ----------------------------------------------------------------
>> Kieran Bingham (4):
>>       v4l: vsp1: Move vsp1_video_setup_pipeline()
>>       v4l: vsp1: Refactor video pipeline configuration
>>       v4l: vsp1: Use local display lists and remove global pipe->dl
>>       media: Catch null pipes on pipeline stop
>>
>>  drivers/media/media-entity.c             |   2 +
>>  drivers/media/platform/vsp1/vsp1_drm.c   |  20 ++---
>>  drivers/media/platform/vsp1/vsp1_drv.c   |   4 +
>>  drivers/media/platform/vsp1/vsp1_pipe.c  |   1 +
>>  drivers/media/platform/vsp1/vsp1_pipe.h  |   4 +-
>>  drivers/media/platform/vsp1/vsp1_video.c | 127 +++++++++++++++----------------
>>  6 files changed, 79 insertions(+), 79 deletions(-)
>
> This conflicts with your own commit f94c16126bec2da4 ("v4l: vsp1:
> Remove redundant context variables"),
> in topic/vsp1-pa-improvements-v1-rebased1.
>
> I fixed it up like this:

> --- a/drivers/media/platform/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/vsp1/vsp1_video.c
> @@@ -350,9 -355,47 +350,48 @@@ static void vsp1_video_frame_end(struc
>         pipe->buffers_ready |= 1 << video->pipe_index;
>   }
>
> + static int vsp1_video_setup_pipeline(struct vsp1_pipeline *pipe,
> +                                    struct vsp1_dl_list *dl)

> +       list_for_each_entry(entity, &pipe->entities, list_pipe) {
>  -              vsp1_entity_route_setup(entity, dl);
> ++              vsp1_entity_route_setup(entity, pipe, pipe->dl);

That should of course have been

                vsp1_entity_route_setup(entity, pipe, dl);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
