Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:59226 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750942AbeEBKNj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 06:13:39 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v3 0/5] drm: rcar-du: r8a77965 DU support
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
References: <20180427222154.21664-1-kieran.bingham+renesas@ideasonboard.com>
 <3133347.E1rqC9Dq6Z@avalon>
 <CAMuHMdVRisZAqt3mEUVoyknatn0oOF1PChwBf7xkEASAaiAQhA@mail.gmail.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <bbfe59c3-67c8-2f2a-1fbf-2d248766a5ad@ideasonboard.com>
Date: Wed, 2 May 2018 11:13:34 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVRisZAqt3mEUVoyknatn0oOF1PChwBf7xkEASAaiAQhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert

On 02/05/18 09:59, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Sat, Apr 28, 2018 at 12:43 AM, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>> On Saturday, 28 April 2018 01:21:49 EEST Kieran Bingham wrote:
>>> The r8a77965 M3-N platform supports a DPAD, HDMI and LVDS output, along
>>> 3 DU channels. However, DU2 is not available in the hardware, with the
>>> DPAD instead being routed through DU3.
>>>
>>> Provide support for this non-linear indexing with updates to the rcar-du
>>> driver, before adding the device info structure for the r8a77965.
>>>
>>>
>>> Kieran Bingham (5):
>>>   dt-bindings: display: renesas: Add R-Car M3-N HDMI TX DT bindings
>>>   pinctrl: sh-pfc: r8a77965: Add DU RGB output pins, groups and
>>>     functions
>>>   drm: rcar-du: Split CRTC handling to support hardware indexing
>>>   drm: rcar-du: Allow DU groups to work with hardware indexing
>>>   drm: rcar-du: Add R8A77965 support
>>
>> I've taken the whole series in my tree for v4.18.
> 
> Shouldn't patch #2 go through sh-pfc?

Yes :-)

Sorry, It looks like I should have split it out from the series.

--
Kieran


> Gr{oetje,eeting}s,
> 
>                         Geert
> 
