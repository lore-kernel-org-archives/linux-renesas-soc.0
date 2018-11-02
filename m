Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:32863 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbeKCCCm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 22:02:42 -0400
Received: by mail-lf1-f65.google.com with SMTP id i26so1806686lfc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Nov 2018 09:54:55 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <fffcebd6-a272-8cf2-b055-2c1d1691b06c@cogentembedded.com>
Date: Fri, 2 Nov 2018 19:54:52 +0300
MIME-Version: 1.0
In-Reply-To: <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 11/01/2018 02:25 AM, Niklas Söderlund wrote:

> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> On H3 (ES1.0,ES2.0) and M3-W (ES1.0,ES1.1) the clock setting for HS400
> needs a quirk to function properly. The reason for the quirk is that
> there are two settings which produces same divider vale for the SDn

   s/vale/value/.

> clock. On the effected boards the one currently selected results in HS00
> not working.
> 
> This change uses the same method as the Gen2 CPG driver and simply
> ignores the first clock setting as this is the offending one when
> selecting the settings. Which of the two possible settings is used have
> no effect for SDR104.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
