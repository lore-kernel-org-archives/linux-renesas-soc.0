Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:53032 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752291AbdLGKug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 05:50:36 -0500
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: issue on rcar-du and/or vsp suspend-resume paths
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Artemi Ivanov <artemi.ivanov@cogentembedded.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>
References: <cf76b16c-5895-301f-ba81-a140e61c8cdf@cogentembedded.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <1d38f330-279e-883f-b327-0e9324f53b45@ideasonboard.com>
Date: Thu, 7 Dec 2017 10:50:31 +0000
MIME-Version: 1.0
In-Reply-To: <cf76b16c-5895-301f-ba81-a140e61c8cdf@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Nikita

On 07/12/17 08:48, Nikita Yushchenko wrote:
> Hello.
> 
> Writing this mail to commiters to rcar-du and vsp1 drivers in kernel branch
> v4.9/rcar-3.5.9 of
> git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git - which
> AFAIU is the latest BSP kernel for Renesas Gen3 SoCs.

Suspend resume is known not to work on this kernel version for VSP1 and rcar-du
on Gen3. You could potentially back-port the relevant patches, but I have not
looked at the dependencies required for this:


I believe the VSP1 was fixed with the following patch series:

[PATCH v5 0/2] v4l: vsp1: Fix suspend/resume and race on M2M pipelines
[PATCH v5 1/2] v4l: vsp1: Move vsp1_video_setup_pipeline()
[PATCH v5 2/2] v4l: vsp1: Repair suspend resume operations for video pipelines

And the RCar DU was fixed with the following patches:

[PATCH v2 0/3] drm/media: Implement DU Suspend and Resume on VSP pipelines
         (1/3 is v3 "media: vsp1" below)
[PATCH v2 2/3] drm: rcar-du: Add suspend resume helpers
[PATCH v2 3/3] drm: rcar-du: Remove unused CRTC suspend/resume functions

[PATCH v3] media: vsp1: Prevent suspending and resuming DRM pipelines

All of the above patches were posted to the linux-renesas-soc mailinglist, and
should be available in the archives.

The best source of the patches would be the tag:
  renesas-drivers-2017-11-28-v4.15-rc1
from
  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git,

which should be functional for suspend/resume on both VSP1 and rcar-du.

> I'm trying to make swsusp (i.e echo disk > /sys/power/state) working on
> r8a7796-m3ulcb board.
> 
> I'm facing an issue with suspend/resume routines of rcar-du driver.
> 
> Currently, suspend-to-mem works on this target. I can run
> # i2cset -f -y 7 0x30 0x20 0x0F
> # echo mem > /sys/power/state
> and target suspends. Then, I can press power button and target resumes,
> including image on HDMI-connected display.
> 
> However, if I try
> 
> # echo devices > /sys/power/pm_test
> # echo mem > /sys/power/state
> 
> which should terminate suspend process after calling drivers method and resume
> immediately, rcar-du resume fails:
> 
> [   75.233956] [drm:drm_atomic_helper_wait_for_flip_done] *ERROR*
> [CRTC:53:crtc-1] flip_done timed out
> [   85.474009] [drm:drm_atomic_helper_commit_cleanup_done] *ERROR*
> [CRTC:53:crtc-1] flip_done timed out

Yes, this looks like the expected errors.

> Same will happen on any other variants of /sys/power/pm_test.
> Resume of rcar-du will only succeed of CPU really goes sleep after suspend of
> rcar-du.
> 
> I've tried a test that calls rcar-du's suspend method, sleeps a bit and calls
> rcar-du's resume method - and that breaks display. In particular, VSP interrupts
> no longer arrive. Although the VSP hardware programming sequence looks exactly
> the same as on normal driver startup or on blank-unblank path.
> 
> For swsusp (and also for suspend-to-mem error paths) it is required that
> driver's resume method undoes what driver's suspend method does, so this
> behavior is definitely a bug.
> 
> Could you please help debugging this?

Backporting the patches, or moving to latest kernel versions would be the
resolution here.


> Nikita Yushchenko,
> system sw engineer at cogentembedded.com
--
Regards

Kieran
