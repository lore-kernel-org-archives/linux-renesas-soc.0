Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:52250 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbeHUL1y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 07:27:54 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulrich Hecht <uli@fpond.eu>
Cc: Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Subject: Re: [PROTO][PATCH 05/10] drm/bridge: adv7511: Add max-clock, min-vrefresh options
Date: Tue, 21 Aug 2018 11:09:43 +0300
Message-ID: <4491168.zjQBQaeJMW@avalon>
In-Reply-To: <163044965.365968.1534838625060@webmail.strato.com>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu> <2454542.vJvYSti9iT@avalon> <163044965.365968.1534838625060@webmail.strato.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Tuesday, 21 August 2018 11:03:45 EEST Ulrich Hecht wrote:
> On August 20, 2018 at 11:28 AM Laurent Pinchart wrote:
> > On Tuesday, 14 August 2018 16:49:59 EEST Ulrich Hecht wrote:
> >> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >> 
> >> This patch adds the option to specify a maximal clock and a minimal
> >> vertical refresh rate.
> > 
> > What is this needed for ?
> 
> Somewhere in the chain there is a component that will not tolerate clocks in
> excess of 135 MHz; if you don't limit it, the default for a 1920x1200
> display is somewhere along 148 MHz, and the HDMI signal output is invalid.

Do you know which component that is ?

-- 
Regards,

Laurent Pinchart
