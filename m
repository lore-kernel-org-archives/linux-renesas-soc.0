Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56858 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731390AbeGQMmO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 08:42:14 -0400
Date: Tue, 17 Jul 2018 14:09:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jiri Slaby <jslaby@suse.com>,
        Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
        Ed Blake <ed.blake@sondrel.com>,
        Stefan Potyra <Stefan.Potyra@elektrobit.com>
Subject: Re: [PATCH v2 2/2] serial: 8250_dw: Add compatible string for
 Renesas RZ/N1 UART
Message-ID: <20180717120949.hs3fofbgj3umcllm@verge.net.au>
References: <1531474429-17146-1-git-send-email-phil.edworthy@renesas.com>
 <1531474429-17146-3-git-send-email-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531474429-17146-3-git-send-email-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 13, 2018 at 10:33:49AM +0100, Phil Edworthy wrote:
> The Renesas RZ/N1 UART is based on the Synopsys DW UART, but has additional
> registers for DMA. This patch does not address the changes required for DMA
> support, it simply adds the compatible string.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
