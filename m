Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 28 May 2018 10:40:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/9] ARM: shmobile: defconfig: Enable MTD command line
 partition parsing
Message-ID: <20180528084029.xqeguqnnk3e3wuim@verge.net.au>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 22, 2018 at 02:02:49PM +0200, Marek Vasut wrote:
> In preparation for removing MTD partitioning from the DTs and moving
> it over to kernel command line partition parsing, enable the support
> for kernel command line MTD partition parsing.
> 
> The argument for not having MTD partitions in the DT is the same as
> for not having hard drive partitions in DT, neither describes the
> hardware itself, so it shouldn't be in the DT. Furthermore, kernel
> command line MTD partition passing allows greater flexibility in
> case someone decided to repartition the flash, which is well in the
> realm of possibility with these systems.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Thanks, applied.
