Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Return-Path: <kieran@ksquared.org.uk>
Sender: Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PULL REQUEST] VSP1 Image Partitioning algorithm
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran@ksquared.org.uk>
References: <1473871510-13807-1-git-send-email-kieran@bingham.xyz>
 <CAMuHMdXFbbzH1Zzzxu68CwLtrccSbtyDrLJGpof2nq7-6CwGtQ@mail.gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Kieran Bingham <kieran@bingham.xyz>
Message-ID: <0737e6ab-0a55-0fdd-2fdc-6514d4872aa6@bingham.xyz>
Date: Mon, 19 Sep 2016 18:17:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXFbbzH1Zzzxu68CwLtrccSbtyDrLJGpof2nq7-6CwGtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19/09/16 16:57, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Wed, Sep 14, 2016 at 6:45 PM, Kieran Bingham <kieran@ksquared.org.uk> wrote:
>> Please consider integrating the latest VSP1 next branch to provide the
>> image partitioning algorithm into renesas-drivers
>>
>> Regards
>>
>> Kieran
>>
>>
>> The following changes since commit c3b809834db8b1a8891c7ff873a216eac119628d:
>>
>>   [media] pulse8-cec: fix compiler warning (2016-09-12 06:42:44 -0300)
>>
>> are available in the git repository at:
>>
>>   git://linuxtv.org/pinchartl/media.git vsp1/next
>>
>> for you to fetch changes up to 9f39e31fbb3fb6ebd75d7012d3574def2f5da596:
>>
>>   v4l: vsp1: Fix spinlock in mixed IRQ context function (2016-09-14 13:06:51 +0300)
> 
> In the mean time, this has been rebased, and more commits have been added?
> I will only pull tomorrow anyway...

Ahh yes,

Looks like a couple of bug-fixes got merged in afterwards.

The vsp1/next branch should also be merged into linux-media/master soon
(potentially today, dependant upon Mauro) ... so it could get in that
way also ...

Cheers

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

-- 
Regards

Kieran Bingham
