Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:42871 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754690AbeBATnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Feb 2018 14:43:55 -0500
Received: by mail-lf0-f52.google.com with SMTP id q17so27982151lfa.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Feb 2018 11:43:55 -0800 (PST)
Subject: Re: [PATCH] DT: serial: renesas,sci-serial: document R8A77980
 bindings
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
References: <2182bb59-d16f-54f0-d992-65b49815ce1d@cogentembedded.com>
Message-ID: <6fbc3525-e601-6ad5-f734-7bf004edadfa@cogentembedded.com>
Date: Thu, 1 Feb 2018 22:43:52 +0300
MIME-Version: 1.0
In-Reply-To: <2182bb59-d16f-54f0-d992-65b49815ce1d@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/01/2018 10:36 PM, Sergei Shtylyov wrote:

> R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible SCIF and HSCIF ports,
> so document the SoC specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

   Forgot to mention that this patch is against the 'tty-next' branch of GregKH's 'tty.git' repo...

MBR, Sergei
