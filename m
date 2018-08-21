Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:23081 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbeHULXi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 07:23:38 -0400
Date: Tue, 21 Aug 2018 10:03:45 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jacopo+renesas@jmondi.org, kieran.bingham+renesas@ideasonboard.com,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Message-ID: <163044965.365968.1534838625060@webmail.strato.com>
In-Reply-To: <2454542.vJvYSti9iT@avalon>
References: <1534254604-24204-1-git-send-email-uli+renesas@fpond.eu>
 <1534254604-24204-6-git-send-email-uli+renesas@fpond.eu>
 <2454542.vJvYSti9iT@avalon>
Subject: Re: [PROTO][PATCH 05/10] drm/bridge: adv7511: Add max-clock,
 min-vrefresh options
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


> On August 20, 2018 at 11:28 AM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> 
> 
> Hi Ulrich,
> 
> Thank you for the patch.
> 
> On Tuesday, 14 August 2018 16:49:59 EEST Ulrich Hecht wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > 
> > This patch adds the option to specify a maximal clock and a minimal vertical
> > refresh rate.
> 
> What is this needed for ?

Somewhere in the chain there is a component that will not tolerate clocks in excess of 135 MHz; if you don't limit it, the default for a 1920x1200 display is somewhere along 148 MHz, and the HDMI signal output is invalid.

CU
Uli
