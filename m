Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41820 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbeLJMTM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:19:12 -0500
Date: Mon, 10 Dec 2018 13:19:08 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Avri Altman <avri.altman@wdc.com>,
        Chris Ball <chris@printf.net>
Subject: Re: [PATCH mmc-utils] use proper type for RPMB blocks_cnt
Message-ID: <20181210121908.tf5o3fxdzapk3ele@verge.net.au>
References: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181130125447.32218-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 30, 2018 at 01:54:47PM +0100, Wolfram Sang wrote:
> The JEDEC standard is confusing. The number of max blocks for reading
> RPMB is determined by CMD23 which can hold an unsigned int and not only
> u16. It is true that the current maximum is 64K of blocks, yet this may
> be extended in the future. Let's not apply a limit here which should be
> checked by the card.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I am a little confused. What is the width of an unsigned int?
If 4 bytes, would using uint32_t make this clearer?

> ---
> 
> It is a bit academic, since we will be limited by MMC_IOC_MAX_BYTES in the
> kernel anyhow. Still, because this is a subtle issue, I think it is worth
> documenting the proper use.
> 
>  mmc_cmds.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/mmc_cmds.c b/mmc_cmds.c
> index 44623fe..69485e9 100644
> --- a/mmc_cmds.c
> +++ b/mmc_cmds.c
> @@ -2070,7 +2070,12 @@ int do_rpmb_read_counter(int nargs, char **argv)
>  int do_rpmb_read_block(int nargs, char **argv)
>  {
>  	int i, ret, dev_fd, data_fd, key_fd = -1;
> -	uint16_t addr, blocks_cnt;
> +	uint16_t addr;
> +	/*
> +	 * for reading RPMB, number of blocks is set by CMD23 only, the packet
> +	 * frame field for that is set to 0. So, the type is not u16 but uint!
> +	 */
> +	unsigned int blocks_cnt;
>  	unsigned char key[32];
>  	struct rpmb_frame frame_in = {
>  		.req_resp    = htobe16(MMC_RPMB_READ),
> -- 
> 2.11.0
> 
