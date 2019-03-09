Return-Path: <SRS0=uGqO=RM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12291C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:10:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBDC52081B
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Mar 2019 11:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="ePQCTPX3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfCILKt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Mar 2019 06:10:49 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38975 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfCILKt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Mar 2019 06:10:49 -0500
Received: by mail-lf1-f65.google.com with SMTP id m13so179225lfb.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2019 03:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2K/HDy9ejUSQlPnuCSMf/sE/kM0/YFTKnZJKNluqV5g=;
        b=ePQCTPX3TPE8pZ2lmmxmw36pciMcy8aYLXa4ucN/fw6j7Oslht3iE1LN9j/gauOp7L
         QYhSafMmXHRrkJCSbjSbALEzOLBrUaGv4580Uvn78pHpJNIujGl5OEF0ljkMz4Gg6VS9
         dvp9SqZubuyZQqya1VhSUrz7yLI2rXQf5sCaFEQEBvQd6qF27CUxb9epbzuSUVc7IZga
         yWeEOlFdnyvLSO9tuEYiI+UXVdw3ymaQVktzKftBKSHvzTCEkhAXrJ9TLmGahtx8yP2H
         sA2nB39L+S4wgZ8Kfh6khovRhwur0xHmdzU/hLY6kV3AM8xa3R20jNhxyAHJmPpaIUWn
         wmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2K/HDy9ejUSQlPnuCSMf/sE/kM0/YFTKnZJKNluqV5g=;
        b=QrrC9LFVYaKxUoNWkVSm+MyyfdPslYGYZcE+lKFRbSBEJKXDk0B4QaW75H1qXUS2j7
         EfDPXggbPtEwWK+//l48lu7IFDUp+6nMsMfzVEtj69YJMasQr2ghFR50LgRLlTKUCUM9
         aofgekA7IeQ/MAKH1BorpUsWuCE8RsF72XHls5O7dKqHlg4VVWMOS980Ab/X+yAIG4gl
         jPNbQgLs0V7lduyAzceVsXbA5xHvLMNoZFRsH4J2X/LagUBvPVOvUHaf6bKRQyB4bqmf
         CRU5wPnoWfbiLhibQJE4sTtSeuM6fnqguq8ru+VexjIDvF91/SqTIVF6LZcA791KTh70
         Waqw==
X-Gm-Message-State: APjAAAVVU/6Lz2LBFL9Z+bOwndiSSZuSfKLDGsitp1g09Y3wks/TPlmv
        cO6F6KLw1TGO7uGAt0B/4Fi+ww==
X-Google-Smtp-Source: APXvYqyl0XxO5cdiYLD3BJsN5uewHFYsXUk+EYIuv+HTZdtSgC+6un2OCJR5zm9nHKL+Si9n4sBlpw==
X-Received: by 2002:a19:d4cf:: with SMTP id l198mr4385028lfg.151.1552129846872;
        Sat, 09 Mar 2019 03:10:46 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id r12sm33334ljc.97.2019.03.09.03.10.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2019 03:10:46 -0800 (PST)
Date:   Sat, 9 Mar 2019 12:10:45 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     marek.vasut@gmail.com
Cc:     linux-pci@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: rcar: Clean up remaining macros defining bits
Message-ID: <20190309111045.GB5281@bigcity.dyn.berto.se>
References: <20190309005613.1493-1-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190309005613.1493-1-marek.vasut@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

Thanks for your patch.

On 2019-03-09 01:56:12 +0100, Marek Vasut wrote:
> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Replace macros using constants with BIT()s instead, no functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Phil Edworthy <phil.edworthy@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pci@vger.kernel.org

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/pci/controller/pcie-rcar.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rcar.c b/drivers/pci/controller/pcie-rcar.c
> index c8febb009454..5b8736f0cd6b 100644
> --- a/drivers/pci/controller/pcie-rcar.c
> +++ b/drivers/pci/controller/pcie-rcar.c
> @@ -46,14 +46,14 @@
>  
>  /* Transfer control */
>  #define PCIETCTLR		0x02000
> -#define  CFINIT			1
> +#define  CFINIT			BIT(0)
>  #define PCIETSTR		0x02004
> -#define  DATA_LINK_ACTIVE	1
> +#define  DATA_LINK_ACTIVE	BIT(0)
>  #define PCIEERRFR		0x02020
>  #define  UNSUPPORTED_REQUEST	BIT(4)
>  #define PCIEMSIFR		0x02044
>  #define PCIEMSIALR		0x02048
> -#define  MSIFE			1
> +#define  MSIFE			BIT(0)
>  #define PCIEMSIAUR		0x0204c
>  #define PCIEMSIIER		0x02050
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
