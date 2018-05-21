Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:46769 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753529AbeEUSJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 14:09:33 -0400
Received: by mail-lf0-f65.google.com with SMTP id t22-v6so6009413lff.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 May 2018 11:09:32 -0700 (PDT)
Subject: Re: [PATCH] PCI: rcar: Poll more often in rcar_pcie_wait_for_dl()
To: Marek Vasut <marek.vasut@gmail.com>, linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-renesas-soc@vger.kernel.org
References: <20180521170250.13224-1-marek.vasut+renesas@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4ba2a3fa-018c-9e90-d167-c0e04e3f6246@cogentembedded.com>
Date: Mon, 21 May 2018 21:09:29 +0300
MIME-Version: 1.0
In-Reply-To: <20180521170250.13224-1-marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/21/2018 08:02 PM, Marek Vasut wrote:

> The data link active signal usually takes ~20 uSec to be asserted,
> poll the bit more often to avoid useless delays in this function.
> Use udelay() instead of usleep() for such a small delay as suggested
> by the timer documentation and because this will be used in atomic
> content later on when the suspend/resume patches land.
  ^^^^^^^ context :-)

> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Phil Edworthy <phil.edworthy@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org
[...]

MBR, Sergei
