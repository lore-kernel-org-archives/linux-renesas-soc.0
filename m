Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44082 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbeBQOMJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Feb 2018 09:12:09 -0500
Received: by mail-lf0-f66.google.com with SMTP id v9so5603701lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Feb 2018 06:12:09 -0800 (PST)
Subject: Re: [PATCH] soc: renesas: r8a77970-sysc: fix power area parents
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
References: <b133e895-8d5e-fbae-d15a-5cf759f09406@cogentembedded.com>
Message-ID: <cba65022-7385-a837-d019-dfb77209126d@cogentembedded.com>
Date: Sat, 17 Feb 2018 17:12:06 +0300
MIME-Version: 1.0
In-Reply-To: <b133e895-8d5e-fbae-d15a-5cf759f09406@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/16/2018 11:09 PM, Sergei Shtylyov wrote:

> According to the figure 9.2(b) of the R-Car Series, 3rd Generation User’s
> Manual: Hardware Rev. 0.80 the A2IRn and A2SCn power areas in R8A77970 have
> the A3IR area as a parent, thus the SYSC driver has those parents wrong...
> 
> Fixes: bab9b2a74fe9 ("soc: renesas: rcar-sysc: add R8A77970 support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  drivers/soc/renesas/r8a77970-sysc.c |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Index: renesas/drivers/soc/renesas/r8a77970-sysc.c
> ===================================================================
> --- renesas.orig/drivers/soc/renesas/r8a77970-sysc.c
> +++ renesas/drivers/soc/renesas/r8a77970-sysc.c

   Done against the recent 'devel' tag but should apply to Linus' repo...

[...]

MBR, Sergei
