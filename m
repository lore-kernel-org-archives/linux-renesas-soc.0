Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:46372 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754102AbdJPTYj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2017 15:24:39 -0400
Received: by mail-lf0-f42.google.com with SMTP id g70so18220482lfl.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Oct 2017 12:24:38 -0700 (PDT)
Subject: Re: [PATCH 10/10] [RFC] sh_eth: Remove obsolete explicit clock
 handling for WoL
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org
References: <1508162116-5043-1-git-send-email-geert+renesas@glider.be>
 <1508162116-5043-11-git-send-email-geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3a3fafd0-5421-5dda-35af-173f6764098b@cogentembedded.com>
Date: Mon, 16 Oct 2017 22:24:35 +0300
MIME-Version: 1.0
In-Reply-To: <1508162116-5043-11-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/16/2017 04:55 PM, Geert Uytterhoeven wrote:

> Currently, if Wake-on-LAN is enabled, the SH-ETH device's module clock

    It's called Ether (or GEther) in all the manuals I have. Never saw SH-ETH, 
I think it's Nobuhiro's invention... :-)

> is manually kept running during system suspend, to make sure the device
> stays active.
> 
> Since "soc: renesas: rcar-sysc: Keep wakeup sources active during system
> suspend" and "clk: renesas: mstp: Keep wakeup sources active during
> system suspend", this workaround is no longer needed.  Hence remove all
> explicit clock handling to keep the device active.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
