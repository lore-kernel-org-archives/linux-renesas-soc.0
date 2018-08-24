Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38459 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbeHXTtS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Aug 2018 15:49:18 -0400
Received: by mail-lf1-f65.google.com with SMTP id i7-v6so7093906lfh.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Aug 2018 09:13:59 -0700 (PDT)
Date: Fri, 24 Aug 2018 18:13:57 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] vin-tests: Fix vdev name in propagate_parallel
Message-ID: <20180824161357.GE1493@bigcity.dyn.berto.se>
References: <1535106262-13004-1-git-send-email-jacopo@jmondi.org>
 <1535106262-13004-3-git-send-email-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1535106262-13004-3-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

Thanks for finding this bug.

On 2018-08-24 12:24:20 +0200, Jacopo Mondi wrote:
> The $vdev variable was not defined in propagate_parallel() function.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Applied to my tree.

> ---
>  scripts/vin-tests.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/vin-tests.sh b/scripts/vin-tests.sh
> index ebb1477..0c5b29a 100644
> --- a/scripts/vin-tests.sh
> +++ b/scripts/vin-tests.sh
> @@ -83,6 +83,7 @@ mc_propagate_cvbs() {
>  }
>  
>  mc_propagate_parallel() {
> +    vin="$1"
>      mdev=$(mc_get_mdev)
>  
>      cam="'$parallelname':1"
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
