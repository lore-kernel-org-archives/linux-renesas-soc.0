Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45770 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbeK2T4O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 14:56:14 -0500
Received: by mail-lf1-f66.google.com with SMTP id b20so808717lfa.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Nov 2018 00:51:35 -0800 (PST)
Subject: Re: [PATCH] clk: renesas: rcar-gen3: set state when registering SD
 clocks
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0909875d-b8eb-2b94-b3e0-2d9cb905ca70@cogentembedded.com>
Date: Thu, 29 Nov 2018 11:51:33 +0300
MIME-Version: 1.0
In-Reply-To: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 11/29/2018 03:15 AM, Niklas Söderlund wrote:

> The driver tries to figure out which state a SD clock is in when the
> clock is register instead of setting a known state. This can be

   Registered?

> problematic for two reasons.
> 
> 1. If the clock driver can't figure out the state of the clock
>    registration of the clock fails and setting of a known state by a
>    clock user is not possible.
> 
> 2. The state of the clock depends on if and how the bootloader
>    configured it. The driver only checks that the rate is known not if
>    the clock is stopped or not for example.
> 
> Fix this by setting a known state and make sure the clock is stopped.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
