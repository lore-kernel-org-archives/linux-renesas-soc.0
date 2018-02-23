Return-Path: <linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org>
From: Yao Lihua <ylhuajnu@outlook.com>
To: Simon Horman <horms+renesas@verge.net.au>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: enable R8A77965 SoC
Date: Fri, 23 Feb 2018 15:29:08 +0000
Message-ID: <SN4PR0601MB3709B0D878715B944580EFCCC4CC0@SN4PR0601MB3709.namprd06.prod.outlook.com>
References: <20180223085115.13782-1-horms+renesas@verge.net.au>
In-Reply-To: <20180223085115.13782-1-horms+renesas@verge.net.au>
Content-Language: en-US
Content-ID: <1A3C3DDCC94DD245B80EFEDD9BAE1FA1@namprd06.prod.outlook.com>
MIME-Version: 1.0
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Magnus Damm <magnus.damm@gmail.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+geert=linux-m68k.org@lists.infradead.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Friday, February 23, 2018 04:51 PM, Simon Horman wrote:
> Enable the Renesas R-Car M3-W (R8A77965) SoC in the ARM64 defconfig.
R8A77965 should be M3-N?
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index ceafd26f0fab..c8b59543f670 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -51,6 +51,7 @@ CONFIG_ARCH_SEATTLE=y
>   CONFIG_ARCH_RENESAS=y
>   CONFIG_ARCH_R8A7795=y
>   CONFIG_ARCH_R8A7796=y
> +CONFIG_ARCH_R8A77965=y
>   CONFIG_ARCH_R8A77970=y
>   CONFIG_ARCH_R8A77980=y
>   CONFIG_ARCH_R8A77995=y

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
