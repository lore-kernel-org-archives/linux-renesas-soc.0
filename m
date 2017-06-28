Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:36648 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751048AbdF1IHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2017 04:07:36 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [GIT PULL FOR renesas-drivers] v4l: vsp1: Suspend/resume on M2M
 pipelines
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <1494335128-30563-1-git-send-email-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdUynJn381HHh4Hi2M-ToxoFpaOrPYGUFv6R9YnRTzT5qg@mail.gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <190d8be3-0481-e08b-1466-0db1147708b9@ideasonboard.com>
Date: Wed, 28 Jun 2017 09:07:28 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUynJn381HHh4Hi2M-ToxoFpaOrPYGUFv6R9YnRTzT5qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 27/06/17 19:52, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Tue, May 9, 2017 at 3:05 PM, Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> The following changes since commit 13e0988140374123bead1dd27c287354cb95108e:
>>
>>   docs: complete bumping minimal GNU Make version to 3.81 (2017-05-06 18:49:09 -0700)
>>
>> are available in the git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git tags/submissions/vsp1/suspend-resume/v5
>>
>> for you to fetch changes up to 24697ebba024a6375ff2e793203296c70112537e:
>>
>>   v4l: vsp1: Repair suspend resume operations for video pipelines (2017-05-08 15:20:58 +0100)
> 
> Dropped, too many conflicts.

Thanks for the notification.

I'll rebase and push again for integration on linux-media.
--
Kieran

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
