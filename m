Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43310 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728442AbeGPTg7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 15:36:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id r13-v6so30870531ljg.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jul 2018 12:08:11 -0700 (PDT)
Subject: Re: [PATCH 1/3] ravb: fix shadowing of symbol 'stats' in
 ravb_get_ethtool_stats()
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
 <20180716121927.21918-2-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a68fdb02-c13b-25e1-922a-9e36f2f6f940@cogentembedded.com>
Date: Mon, 16 Jul 2018 22:08:09 +0300
MIME-Version: 1.0
In-Reply-To: <20180716121927.21918-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/16/2018 03:19 PM, Niklas Söderlund wrote:

> Inside a loop in ravb_get_ethtool_stats() a variable 'stats' is declared
> resulting in the argument also named 'stats' to be shadowed. Fix this
> warning by renaming the unused argument 'stats' to 'estats'.
> 
> This fixes the sparse warning:
> 
> ravb_main.c:1225:36: originally declared here
> ravb_main.c:1233:41: warning: symbol 'stats' shadows an earlier one
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
