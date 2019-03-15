Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CFF3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:43:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4412D20854
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 12:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfCOMnt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 08:43:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:58676 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726957AbfCOMnt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 08:43:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id AE047AD73;
        Fri, 15 Mar 2019 12:43:47 +0000 (UTC)
Date:   Fri, 15 Mar 2019 13:43:45 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools 1/2] tools: i2ctransfer: consequently document
 -a
Message-ID: <20190315134345.333416b2@endymion>
In-Reply-To: <20190311223335.18586-2-wsa+renesas@sang-engineering.com>
References: <20190311223335.18586-1-wsa+renesas@sang-engineering.com>
        <20190311223335.18586-2-wsa+renesas@sang-engineering.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, 11 Mar 2019 23:33:34 +0100, Wolfram Sang wrote:
> The text describing the address to be used did not reflect the recent
> change where some of the functionality of '-f' has been seperated into
> '-a'.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  CHANGES             | 1 +
>  tools/i2ctransfer.8 | 8 +++++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/CHANGES b/CHANGES
> index e2ea015..e9d46b5 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -5,6 +5,7 @@ master
>    tools: Consistently use snprintf instead of sprintf
>    decode-dimms: Print SPD revision for DDR3 too
>                  Move SDR-specific code
> +  i2ctransfer: Mention '-a' everywhere in the manpage

Not sure how "once" qualifies as "everywhere" ;-)

>  
>  4.1 (2018-11-30)
>    Makefile: Make STRIP, DESTDIR and PREFIX overridable
> diff --git a/tools/i2ctransfer.8 b/tools/i2ctransfer.8
> index 5d3cc27..1f8ed82 100644
> --- a/tools/i2ctransfer.8
> +++ b/tools/i2ctransfer.8
> @@ -96,10 +96,12 @@ It is parsed as an unsigned 16 bit integer, but note that the Linux Kernel appli
>  specifies the 7-bit address of the chip to be accessed for this message, and is an integer.
>  If omitted, reuse the previous address.
>  Normally, addresses outside the range of 0x03-0x77 and addresses with a kernel driver attached to them will be blocked.
> -With
> +This can be overridden with
> +.I -a
> +(all) or
>  .I -f
> -(force), all addresses can be used.
> -Be very careful when using that!
> +(force).
> +Be very careful when using these!
>  10-bit addresses are currently not supported at all.
>  
>  .PP

Looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
