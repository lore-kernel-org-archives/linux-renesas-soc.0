Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755819AbcK3KAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Nov 2016 05:00:19 -0500
Date: Wed, 30 Nov 2016 11:00:11 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ARM: shmobile: gose: Add da9063 PMIC device node for
 system restart
Message-ID: <20161130100011.GD2336@verge.net.au>
References: <1479407866-7375-1-git-send-email-geert+renesas@glider.be>
 <20161130095850.GC2336@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161130095850.GC2336@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 30, 2016 at 10:58:51AM +0100, Simon Horman wrote:
> On Thu, Nov 17, 2016 at 07:37:46PM +0100, Geert Uytterhoeven wrote:
> > Enable i2c6, and add a device node for the da9063 PMIC, with subnodes
> > for rtc and wdt.  Regulator support is not yet included.
> > 
> > This allows the system to be restarted when the watchdog timer times
> > out, or when a system restart is requested.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks, I have queued this up for v4.11.

... with s/shmobile/dts/ applied to the subject
