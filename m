Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:44790 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbeHVRYb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 13:24:31 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <uli@fpond.eu>
Cc: Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PROTO][PATCH 05/10] drm/bridge: adv7511: Add max-clock, min-vrefresh options
Date: Wed, 22 Aug 2018 17:00:26 +0300
Message-ID: <1757500.XeSFtVI82s@avalon>
In-Reply-To: <1145018473.417930.1534929239255@webmail.strato.com>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu> <4491168.zjQBQaeJMW@avalon> <1145018473.417930.1534929239255@webmail.strato.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wednesday, 22 August 2018 12:13:59 EEST Ulrich Hecht wrote:
> On August 21, 2018 at 10:09 AM Laurent Pinchart wrote:
> > On Tuesday, 21 August 2018 11:03:45 EEST Ulrich Hecht wrote:
> >> On August 20, 2018 at 11:28 AM Laurent Pinchart wrote:
> >>> On Tuesday, 14 August 2018 16:49:59 EEST Ulrich Hecht wrote:
> >>>> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >>>> 
> >>>> This patch adds the option to specify a maximal clock and a minimal
> >>>> vertical refresh rate.
> >>> 
> >>> What is this needed for ?
> >> 
> >> Somewhere in the chain there is a component that will not tolerate
> >> clocks in excess of 135 MHz; if you don't limit it, the default for a
> >> 1920x1200 display is somewhere along 148 MHz, and the HDMI signal
> >> output is invalid.
> > 
> > Do you know which component that is ?
> 
> Unfortunately not. It's not the ADV7511, though, that goes up to 225 MHz...

After investigation, it turns out that the THC63LVD1024 is the culprit, its 
datasheet reports a maximum operating frequency of 135 MHz.

Do you have any idea what the minimal refresh rate is for ?

-- 
Regards,

Laurent Pinchart
