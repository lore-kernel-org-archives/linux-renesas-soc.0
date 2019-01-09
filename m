Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D2BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:47:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF981206B6
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:47:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="S3xYJRSG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbfAIMrE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 07:47:04 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:18806 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729919AbfAIMrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 07:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1547038021;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=7L2OFxdVALZXZToDvH5HFty3OmUXQsHNmBc1LbNcW6c=;
        b=S3xYJRSGXHm7uDTTNmspTR5eqg+fil8NdyqFXLc/vnnFNFp6fSi0ja51PNp1039UCk
        l4lDV7dlnnQDc4gfr9mE4yH5tlxbBgPhQNPa61HLbzH9DjxBpQLt7pwwXwrF3ZibnnII
        8GcH3E4Cqoi5BNCpyXkQD8E3UpaEAEUISN23sgk4wv/yhTXiPfWysLmcAZ4dzzsQOker
        0OQTziUkcYVoEvABU+EQxMUYi1LbHyKpdfEyDVCw5HnFp1TkL6njLxsZ0zWzYfmH55OU
        txUj3LRPjNazM1DfM1q0D+eF/GPDYfP9jk22urI+IJIEgZEPvVvKrUZ+xVk8funkh57u
        lVlw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.9 AUTH)
        with ESMTPSA id V028b8v09Cl0IdP
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Jan 2019 13:47:00 +0100 (CET)
Date:   Wed, 9 Jan 2019 13:47:00 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Message-ID: <428987666.1195881.1547038020104@webmail.strato.com>
In-Reply-To: <20190107162320.15530-2-geert+renesas@glider.be>
References: <20190107162320.15530-1-geert+renesas@glider.be>
 <20190107162320.15530-2-geert+renesas@glider.be>
Subject: Re: [PATCH v5 1/4] serial: sh-sci: Extract
 sci_dma_rx_chan_invalidate()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev47
X-Originating-IP: 85.212.162.185
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On January 7, 2019 at 5:23 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> The cookies and channel pointer for the DMA receive channel are
> invalidated in two places, and one more is planned.
> Extract this functionality in a common helper.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  drivers/tty/serial/sh-sci.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 8df0fd8245203f8b..4c75468680cb547d 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -1243,12 +1243,22 @@ static int sci_dma_rx_find_active(struct sci_port *s)
>  	return -1;
>  }
>  
> +static void sci_dma_rx_chan_invalidate(struct sci_port *s)
> +{
> +	unsigned int i;
> +
> +	s->chan_rx = NULL;
> +	for (i = 0; i < ARRAY_SIZE(s->cookie_rx); i++)
> +		s->cookie_rx[i] = -EINVAL;
> +	s->active_rx = 0;
> +}
> +
>  static void sci_rx_dma_release(struct sci_port *s)
>  {
>  	struct dma_chan *chan = s->chan_rx_saved;
>  
> -	s->chan_rx_saved = s->chan_rx = NULL;
> -	s->cookie_rx[0] = s->cookie_rx[1] = -EINVAL;
> +	s->chan_rx_saved = NULL;
> +	sci_dma_rx_chan_invalidate(s);
>  	dmaengine_terminate_sync(chan);
>  	dma_free_coherent(chan->device->dev, s->buf_len_rx * 2, s->rx_buf[0],
>  			  sg_dma_address(&s->sg_rx[0]));
> @@ -1367,10 +1377,7 @@ static int sci_submit_rx(struct sci_port *s, bool port_lock_held)
>  		spin_lock_irqsave(&port->lock, flags);
>  	if (i)
>  		dmaengine_terminate_async(chan);
> -	for (i = 0; i < 2; i++)
> -		s->cookie_rx[i] = -EINVAL;
> -	s->active_rx = 0;
> -	s->chan_rx = NULL;
> +	sci_dma_rx_chan_invalidate(s);
>  	sci_start_rx(port);
>  	if (!port_lock_held)
>  		spin_unlock_irqrestore(&port->lock, flags);
> -- 
> 2.17.1
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
