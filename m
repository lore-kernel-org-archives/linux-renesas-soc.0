Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40905 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728787AbeGPTrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 15:47:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id j19-v6so5515915ljc.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jul 2018 12:18:15 -0700 (PDT)
Subject: Re: [PATCH 2/3] ravb: fix warning about memcpy length
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
 <20180716121927.21918-3-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b1dd6076-7c20-9b11-47c5-dfa847f89ccf@cogentembedded.com>
Date: Mon, 16 Jul 2018 22:18:13 +0300
MIME-Version: 1.0
In-Reply-To: <20180716121927.21918-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/16/2018 03:19 PM, Niklas Söderlund wrote:
> This fixes sparse warning:
> 
> ravb_main.c:1257 ravb_get_strings() error: memcpy() '*ravb_gstrings_stats' too small (32 vs 960)

   It's good that's not a real bug! :-)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
