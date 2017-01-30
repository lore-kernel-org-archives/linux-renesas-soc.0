Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:38785 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752501AbdA3JeD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 04:34:03 -0500
Received: by mail-wm0-f48.google.com with SMTP id r141so24542938wmg.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2017 01:33:54 -0800 (PST)
Date: Mon, 30 Jan 2017 10:33:50 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 0/2] clocksource: Add renesas-ostm timer driver
Message-ID: <20170130093350.GA2206@mai>
References: <20170127200215.4894-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170127200215.4894-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jan 27, 2017 at 03:02:13PM -0500, Chris Brandt wrote:
> This patch set adds a new clocksource driver that uses the OS Timer
> (OSTM) that exists in the R7S72100 (RZ/A1) SoC.
> 
> The operation of the driver was tested with a simple user application
> that does multiple calls to nanosleep() and gettimeofday().
> 
> The purpose of adding this driver is to get better time keeping
> accuracy over the default MTU2 clocksource timer.
> 
> v7:
> * initialize *ostm_clk=NULL to remove 'may be used uninitialized'
>   warning. Reported by "kbuild test robot"

Hi Chris,

I queued up the patches for 4.11.

Thanks !

  -- Daniel
