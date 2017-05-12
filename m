Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 12 May 2017 10:14:34 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Matt Porter <mporter@konsulko.com>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>
Subject: Re: [PATCH v3 4/6] spi: sh-msiof: Add slave mode support
Message-ID: <20170512151434.bwzak7rqna3racdq@rob-hp-laptop>
References: <1493919951-32122-1-git-send-email-geert+renesas@glider.be>
 <1493919951-32122-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493919951-32122-5-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, May 04, 2017 at 07:45:49PM +0200, Geert Uytterhoeven wrote:
> From: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>
> 
> Add slave mode support to the MSIOF driver, in both PIO and DMA mode.
> 
> For now this only supports the transmission of messages with a size
> that is known in advance.
> 
> Signed-off-by: Hisashi Nakamura <hisashi.nakamura.ak@renesas.com>
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> [geert: Timeout handling cleanup, spi core integration, cancellation,
> 	rewording]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Clear TIF_SIGPENDING when interrupted to fix cancellation,
>   - Extract sh_msiof_wait_for_completion(),
>   - Add #include <linux/sched/signal.h>,
>   - Convert to use spi_alloc_slave(),
> 
> v2:
>   - Document "spi-slave" property in DT bindings,
>   - Use spi_controller_is_slave() helper,
>   - Check for "spi-slave" property instead of "slave" child node,
>   - Replace SPI_MASTER_IS_SLAVE by SPI_CONTROLLER_IS_SLAVE,
>   - Implement cancellation.
> ---
>  Documentation/devicetree/bindings/spi/sh-msiof.txt |   2 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/spi/spi-sh-msiof.c                         | 121 +++++++++++++++------
>  include/linux/spi/sh_msiof.h                       |   6 +
>  3 files changed, 96 insertions(+), 33 deletions(-)
