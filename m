Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:45149 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935936AbeFMPXU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 11:23:20 -0400
Received: by mail-lf0-f66.google.com with SMTP id n3-v6so4544182lfe.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jun 2018 08:23:19 -0700 (PDT)
Subject: Re: [PATCH/RFT v2 1/2] arm64: dts: r8a77995: Add SCIF-{0,1,3,4,5}
 device nodes
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <20180613151348.28697-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <76d7deba-37ad-92e1-a86a-0b407fb7dc20@cogentembedded.com>
Date: Wed, 13 Jun 2018 18:23:16 +0300
MIME-Version: 1.0
In-Reply-To: <20180613151348.28697-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 06/13/2018 06:13 PM, Simon Horman wrote:

> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds the device nodes for SCIF-{0,1,3,4,5} serial ports,

   Why hyphen between SCIF and # here in the subject?

> incl. clocks and power domain.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> [simon: updated internal clock from S3D1 to S3D1C to match documentation]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
