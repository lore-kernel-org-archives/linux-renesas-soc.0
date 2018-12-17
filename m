Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CA8C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 18:55:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 900A721783
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 18:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="UiRubWDf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732410AbeLQSzb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 13:55:31 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36045 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728273AbeLQSzb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 13:55:31 -0500
Received: by mail-lj1-f196.google.com with SMTP id g11-v6so11985142ljk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Dec 2018 10:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mK8FxPSg3yEXlR4c/dgVe8ombh9XrqEJVxE4vCuZPZs=;
        b=UiRubWDf0bjvjXEStS5i8v9jM7u6suXB0sOQK7GgK6xLimwaSAGg55q613QbHa+yeF
         uAaF47ii+fIcS60cx0mTP1pXvg4WabAXju6s/tzQipMDqTE85CqRKnjVmijydV5XWZwC
         kk4qREGZSOWTXv/uVhv3doSXLB4nuOkW18A9LuwFcN3D2yoI/8s7UdbwVoGfUaRfDtAx
         xNvsH7kz5VgDneC2Id3slAz98GmYNnC5uNJvDcs3dVCTKh4TEjaE7ntysIk7NyslPwwi
         jk+CZfGKXUen1KgXUNClCqKKiPp6MU6AIUFEED8H/a8hAagOJcdgByUKBOEz1v9IFPv5
         jGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=mK8FxPSg3yEXlR4c/dgVe8ombh9XrqEJVxE4vCuZPZs=;
        b=c7dS8hlwWdJPPpiQ+2WrPqgVVD2fgGWRsmyuN8fgrbOjEngotLX1xMpIDSXy3X0WL6
         Np8j6MUKSkjNNXTkRWN/QGv2MEtOVuZIJp73qQrplj94anZ+REbWePkA9R3rednKX4Cb
         C+G8Wlg3TvDf6zL6qIqJSrDdAVuif49HI+MqMjpy4zZ6t5PDTFKYPEjw0/eP2jCTMyMK
         lI6dx1BC69MbF8Ba0cKViX1svEptT/F1LBu4SPRLxPIhQOw14fChSSoMzAvcCNG8cDDU
         sIoWlZtBsgUQHNGZjeJN/iwp1HyYdrLJWQDDW5DD3K3vf1DtGDTSMduvt6Kv3/qNb5tD
         6odA==
X-Gm-Message-State: AA+aEWYwCwpF+x/jiSRAGCcr0c0yaU2OK3dHTi5mn3RVJSpvx9tNaGHW
        +cZSPGEJfmy3o93m8dUzSajmVg==
X-Google-Smtp-Source: AFSGD/VL5AyEBpt7MKooj/bPc6IzjNW/DZLkzDjs0MmtImOj3jsaU5XNt0XdUEc/FGi5oyNYBADR4w==
X-Received: by 2002:a2e:681a:: with SMTP id c26-v6mr7946290lja.175.1545072928545;
        Mon, 17 Dec 2018 10:55:28 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.84])
        by smtp.gmail.com with ESMTPSA id r69sm2885928lfi.15.2018.12.17.10.55.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 10:55:26 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v3 1/2] spi: Add Renesas R-Car Gen3 RPC SPI controller
 driver
To:     masonccyang@mxic.com.tw
Cc:     boris.brezillon@bootlin.com, broonie@kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, marek.vasut@gmail.com,
        zhengxunli@mxic.com.tw
References: <1544181199-3373-1-git-send-email-masonccyang@mxic.com.tw>
 <1544181199-3373-2-git-send-email-masonccyang@mxic.com.tw>
 <557c8114-2819-7be3-21b8-02918aa89c04@cogentembedded.com>
 <OFAE786891.A102E46D-ON48258366.002779D7-48258366.002A5C36@mxic.com.tw>
Organization: Cogent Embedded
Message-ID: <bfda743d-4aa0-732f-e240-9435647a4856@cogentembedded.com>
Date:   Mon, 17 Dec 2018 21:55:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <OFAE786891.A102E46D-ON48258366.002779D7-48258366.002A5C36@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 12/17/2018 10:42 AM, masonccyang@mxic.com.tw wrote:

>> > +static int rpc_spi_io_xfer(struct rpc_spi *rpc,
>> > +            const void *tx_buf, void *rx_buf)
>> > +{
>> > +   u32 smenr, smcr, data, pos = 0;
>> > +   int ret = 0;
>> > +
>> > +   regmap_write(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD | RPC_CMNCR_SFDE |
>> > +              RPC_CMNCR_MOIIO_HIZ | RPC_CMNCR_IOFV_HIZ |
>> > +              RPC_CMNCR_BSZ(0));
>> > +   regmap_write(rpc->regmap, RPC_SMDRENR, 0x0);
>> > +   regmap_write(rpc->regmap, RPC_SMCMR, rpc->cmd);
>> > +   regmap_write(rpc->regmap, RPC_SMDMCR, rpc->dummy);
>> > +   regmap_write(rpc->regmap, RPC_SMADR, rpc->addr);
>> > +
>> > +   if (tx_buf) {
>> > +      smenr = rpc->smenr;
>> > +
>> > +      while (pos < rpc->xferlen) {
>> > +         u32 nbytes = rpc->xferlen  - pos;
>> > +
>> > +         regmap_write(rpc->regmap, RPC_SMWDR0,
>> > +                 get_unaligned((u32 *)(tx_buf + pos)));
>> > +
>> > +         if (nbytes > 4) {
>> > +            nbytes = 4;
>> > +            smcr = rpc->smcr |
>> > +                   RPC_SMCR_SPIE | RPC_SMCR_SSLKP;
>> > +         } else {
>> > +            smcr = rpc->smcr | RPC_SMCR_SPIE;
>> > +         }
>> > +
>> > +         regmap_write(rpc->regmap, RPC_SMENR, smenr);
>> > +         regmap_write(rpc->regmap, RPC_SMCR, smcr);
>> > +         ret = wait_msg_xfer_end(rpc);
>> > +         if (ret)
>> > +            goto out;
>> > +
>> > +         pos += nbytes;
>> > +         smenr = rpc->smenr & ~RPC_SMENR_CDE &
>> > +                    ~RPC_SMENR_ADE(0xf);
>> > +      }
>> > +   } else if (rx_buf) {
>> > +      while (pos < rpc->xferlen) {
>> > +         u32 nbytes = rpc->xferlen  - pos;
>> > +
>> > +         if (nbytes > 4)
>> > +            nbytes = 4;
>> > +
>> > +         regmap_write(rpc->regmap, RPC_SMENR, rpc->smenr);
>> > +         regmap_write(rpc->regmap, RPC_SMCR,
>> > +                 rpc->smcr | RPC_SMCR_SPIE);
>>
>>    Hm... our flash chip (Spansion S25FS512S) doesn't get detected; it sends
>> JEDEC ID bytes 0..3 repeatedly, unless I copy the SSLKP logic from the writing
>> branch above...
> 
> Do you switch the SW1, SW2, SW3, SW13, SW31 and SW10 to on-board QSPI mode ?
> Because R-Car D3 Draak board default is booting from HyperFlsah.

   I was testing your patch on the V3H-based Condor and Starter Kit boards --
it should have worked without much ado...
   It works with *our* driver, living under drivers/mtd/spi-nor/ (which makes
it outdated, AFAIU) and I was going to push it upstream before I learned about
your driver. :-)

> what follows is my booting log, FYI.
> ------------------------------------------------------------------
> [    1.625053] m25p80 spi5.0: s25fl129p1 (16384 Kbytes)

   So another Spansion flash?

> [    1.634391] 12 fixed-partitions partitions found on MTD device spi5.0
> [    1.642198] Creating 12 MTD partitions on "spi5.0":
> [    1.647598] 0x000000000000-0x000000040000 : "Bank 1 - Boot parameter"
> [    1.660893] 0x000000040000-0x000000180000 : "Bank 1 - Loader-BL2"
> [    1.671287] 0x000000180000-0x0000001c0000 : "Bank 1 - Certification"
> -----------------------------------------------------------------------
> 
>>
>> > +         ret = wait_msg_xfer_end(rpc);
>> > +         if (ret)
>> > +            goto out;
>> > +
>> > +         regmap_read(rpc->regmap, RPC_SMRDR0, &data);
>> > +         memcpy_fromio(rx_buf + pos, (void *)&data, nbytes);
>> > +         pos += nbytes;
>>
>>    ... and it skips byte 4 unless I copy the code from the end of the writing
>> branch, clearing CDE/ADE. But even then the byte 4 reads as 0x03 instead of 0.
> 
> yup, I think this is some kind of RPC HW limitation,
> in RPC manual I/O mode, it only could read 4 bytes data w/ one command.

   Thank for the info -- seems worth a comment though...

> That is, one command + read 4 bytes data + read 4 bytes data + read 4 bytes data + ...
> will get the incorrect data.

   What if we want to read less than 4 bytes (the ID read requests SPI_NOR_MAX_ID_LEN
(6) bytes, i.e. 4 + 2)? You seem to always expect 4 bytes...

> That's why RPC in manual I/O mode, driver only could do,
> one command + read 4 bytes data; one command + read 4 bytes data and so on.

   The question is why it just duplicates the ID bytes 0..3 on the 2nd iteration
in our case...

> But RPC in external address space read mode(here we call it direct mapping read mode)
> is ok for one command + read 4 bytes data + read 4 bytes data + ....

   Sounds promising... if only we could make the probing work. :-)

> thanks & best regards,
> Mason

MBR, Sergei
