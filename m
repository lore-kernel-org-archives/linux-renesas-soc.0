Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35553 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752354AbdLKTjW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Dec 2017 14:39:22 -0500
Received: by mail-lf0-f54.google.com with SMTP id j124so20536047lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2017 11:39:22 -0800 (PST)
Subject: Re: [PATCH] Revert "ravb: add workaround for clock when resuming with
 WoL enabled"
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        "David S . Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1512982449-11051-1-git-send-email-geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <48217228-df4b-59a3-da14-328a3e1a405b@cogentembedded.com>
Date: Mon, 11 Dec 2017 22:39:18 +0300
MIME-Version: 1.0
In-Reply-To: <1512982449-11051-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/11/2017 11:54 AM, Geert Uytterhoeven wrote:

> This reverts commit fbf3d034f2ff6264183cfa6845770e8cc2a986c8.
> 
> As of commit 560869100b99a3da ("clk: renesas: cpg-mssr: Restore module
> clocks during resume"), the workaround is no longer needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
