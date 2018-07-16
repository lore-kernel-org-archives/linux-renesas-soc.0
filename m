Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40196 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728359AbeGPUVc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jul 2018 16:21:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id j19-v6so5598821ljc.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jul 2018 12:52:36 -0700 (PDT)
Subject: Re: [PATCH 3/3] ravb: fix byte order for TX descriptor tag field
 lower bits
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180716121927.21918-1-niklas.soderlund+renesas@ragnatech.se>
 <20180716121927.21918-4-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fa8eec6c-fb0b-cb44-a891-e09d5b738672@cogentembedded.com>
Date: Mon, 16 Jul 2018 22:52:33 +0300
MIME-Version: 1.0
In-Reply-To: <20180716121927.21918-4-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/16/2018 03:19 PM, Niklas Söderlund wrote:

> The wrong helper is used to swap the bytes when adding the lower bits of
> the TX descriptors tag field in the shared ds_tagl variable. The
> variable contains the DS[11:0] field and then the TAG[3:0] bits.
> 
> The mistake was highlighted by the sparse warning:
> 
> ravb_main.c:1622:31:    left side has type restricted __le16
> ravb_main.c:1622:31:    right side has type unsigned short
> ravb_main.c:1622:31: warning: invalid assignment: |=
> ravb_main.c:1622:34: warning: cast to restricted __le16

  Again, it's good that it's not a real bug! :-)

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
