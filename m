Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:32964 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751040AbdBAPzw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 10:55:52 -0500
Received: by mail-lf0-f43.google.com with SMTP id x1so144072584lff.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Feb 2017 07:55:51 -0800 (PST)
Subject: Re: [PATCH 1/2] sh_eth: align usage of sh_eth_modify() with rest of
 driver
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org
References: <20170201144155.17123-1-niklas.soderlund+renesas@ragnatech.se>
 <20170201144155.17123-2-niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ba671d9f-6f2f-0c4a-b94c-a885d54f39dc@cogentembedded.com>
Date: Wed, 1 Feb 2017 18:55:48 +0300
MIME-Version: 1.0
In-Reply-To: <20170201144155.17123-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 02/01/2017 05:41 PM, Niklas Söderlund wrote:

> To be consistent with the rest of the driver when setting bits using
> sh_eth_modify() the same bit should also be cleared. This have no
> functional change and should have been done from the start.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Suggested-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
