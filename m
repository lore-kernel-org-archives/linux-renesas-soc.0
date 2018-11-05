Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57720 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbeKFBCY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 20:02:24 -0500
Date: Mon, 5 Nov 2018 16:42:03 +0100
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add all HSCIF nodes
Message-ID: <20181105154202.bchgx2yxnmjxygte@verge.net.au>
References: <1540071027-27130-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1540071027-27130-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 21, 2018 at 06:30:27AM +0900, Yoshihiro Kaneko wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> This patch adds the device nodes for all HSCIF serial ports to
> the R8A77990 SoC.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> This patch is based on the devel branch of Simon Horman's renesas tree.

Thanks.

I don't believe this can (easily) be tested as HSCIF
does not appear to be exposed on the Ebisu board.

I have checked this patch with reference to the documentation
and it looks good to me. I have applied if for v4.21.
