Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33676 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752784AbdDRMrZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 08:47:25 -0400
Received: by mail-lf0-f46.google.com with SMTP id 88so33321164lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2017 05:47:24 -0700 (PDT)
Subject: Re: [PATCH net-next] ravb: Fix ravb_ptp_interrupt clear interrupt all
 status
To: Simon Horman <horms+renesas@verge.net.au>,
        David Miller <davem@davemloft.net>
References: <1492476933-7952-1-git-send-email-horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <6c952a9b-a8f3-9890-e985-8081ee8de215@cogentembedded.com>
Date: Tue, 18 Apr 2017 15:47:21 +0300
MIME-Version: 1.0
In-Reply-To: <1492476933-7952-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 04/18/2017 03:55 AM, Simon Horman wrote:

> From: Tsutomu Izawa <tsutomu.izawa.xk@renesas.com>
>
> This patch fixes ravb_ptp_interrupt clears GIS register of all interrupts

     Clearing, maybe?

> status. It corrects to clear PTCF bit or PTMF bit.

     Well, it's safer to clear all of them, I think...

> Also it fixes returned value to IRQ_HANDLED or IRQ_NONE.
>
> Signed-off-by: Tsutomu Izawa <tsutomu.izawa.xk@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/net/ethernet/renesas/ravb.h      |  4 ++--
>  drivers/net/ethernet/renesas/ravb_main.c | 12 ++++--------
>  drivers/net/ethernet/renesas/ravb_ptp.c  | 15 ++++++++++++---
>  3 files changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
> index 0525bd696d5d..fbfdefa659ce 100644
> --- a/drivers/net/ethernet/renesas/ravb.h
> +++ b/drivers/net/ethernet/renesas/ravb.h
[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 8cfc4a54f2dc..747686386513 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -820,10 +820,8 @@ static irqreturn_t ravb_interrupt(int irq, void *dev_id)
>  	}
>
>  	/* gPTP interrupt status summary */
> -	if (iss & ISS_CGIS) {
> -		ravb_ptp_interrupt(ndev);
> -		result = IRQ_HANDLED;
> -	}
> +	if (iss & ISS_CGIS)
> +		result = ravb_ptp_interrupt(ndev);

    No, this reintroduces the same kind of bug that we've fixed already:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=38c848c73180fb1d142a39e664b6d9663751f6b2

[...]
> @@ -853,10 +851,8 @@ static irqreturn_t ravb_multi_interrupt(int irq, void *dev_id)
>  	}
>
>  	/* gPTP interrupt status summary */
> -	if (iss & ISS_CGIS) {
> -		ravb_ptp_interrupt(ndev);
> -		result = IRQ_HANDLED;
> -	}
> +	if (iss & ISS_CGIS)
> +		result = ravb_ptp_interrupt(ndev);

    Here as well... look at the other handlers returning success.

[...]

MBR, Sergei
