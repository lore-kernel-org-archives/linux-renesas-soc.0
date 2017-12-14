Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55452 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdLNA2p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 19:28:45 -0500
Subject: Re: [RFC PATCH 1/3] kms-tests: Provide .gitignore
To: Kieran Bingham <kbingham@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <cover.417c1b91fc9842fb290756d5ad23bdc16970b1e1.1513211056.git-series.kieran@bingham.xyz>
 <e5595b1910e29c055c0345b2abf5d730bfaf2e31.1513211056.git-series.kieran@bingham.xyz>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <115be458-f9a7-a06a-9da9-f071a58c865e@ideasonboard.com>
Date: Thu, 14 Dec 2017 00:28:41 +0000
MIME-Version: 1.0
In-Reply-To: <e5595b1910e29c055c0345b2abf5d730bfaf2e31.1513211056.git-series.kieran@bingham.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 14/12/17 00:25, Kieran Bingham wrote:
> From: Kieran Bingham <kieran@bingham.xyz>

Ahem - Please excuse that person - he's not meant to be working.

> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

This guy is.

One day I'll acknowledge that my e-mail aliasing is completely overcomplicated.

--
George (Must be one of my other alter-egos)



> 
> Provide an initial .gitignore file to hide python related
> files that may be created in an active workspace
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  .gitignore | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 .gitignore
> 
> diff --git a/.gitignore b/.gitignore
> new file mode 100644
> index 000000000000..8df6f4ad55ab
> --- /dev/null
> +++ b/.gitignore
> @@ -0,0 +1,4 @@
> +*.log
> +*.swp
> +*.pyc
> +__pycache__
> 
