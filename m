Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93B4C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 23:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 71AB22064A
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 23:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vZasORri"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfCHXXV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 18:23:21 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35196 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbfCHXXV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 18:23:21 -0500
Received: by mail-wm1-f65.google.com with SMTP id y15so13798288wma.0;
        Fri, 08 Mar 2019 15:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ITYIFpRdkTQUVTpPCXc9gDnbG/sEADv07AjF7D8oBmc=;
        b=vZasORripGat2hmOrsgLjImVoRaR7JURXWn30HyZdSxMVs2KKdiHq4mhrmdErDJmwf
         cHRdQF+fz9vzvq0QcCLyZdswwiGLlLi34wCZtDc6e7oYWQq7im2K4I2ORMCEn9a+V6v5
         yKc3EWAZFk3OYReizOwcETu5NN02XHLIBRrHE+J9JpnGNpMGfIP2ZOEdzEOjtdYNPd/g
         ZY6vRO18VD0znn63HGM8bEWNTd3FjlIxzWBfdeCmmuCIaf3xSm+3cQIcDtOxc7v53fea
         CuC1F2qbDYmmx4AO0mktzp4egrroyk4U3Y3ABEsqy2oNFdquxtXmFwt5MENPrTdM8q+O
         Qcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ITYIFpRdkTQUVTpPCXc9gDnbG/sEADv07AjF7D8oBmc=;
        b=sswvFdw4Q9GSugvE2vZCqdh64cAGQirJ3E+18VBQoNw9YAmXl9EIJNCsTxhQsfFb/Y
         zyde4DUTwNf4k/HJxyxYakfy+sjQv+yWMm7EtU1Pfk7ZwjrLwYWvetotnBWNS/+CchPo
         4bhT3311vmx4y7eFzKJqq6Xj2ZU/eOAwfnybShIn3y2CxvlYh8U3ut7iPuR8encrUD5S
         szrGYhjrrNcRtdUrpDrHCeHDYihBjYOSOdl+K5y+9wQx+XDl10I63HQD5WS8wJ4wJgZi
         x2dGea9Edl7sP9ucftj1PZgQOXdpqb0id7kdbh0/bFgr1sxWEFPoADo+uI7AZ2MPx5AR
         y4Iw==
X-Gm-Message-State: APjAAAVxwAvnhAn6q5gz0BQiI0DExB9FJ+3W4LcpURTUmJAkjvcbDgd5
        KTapdR6UZtMdQdARalDTnTEnsOv0
X-Google-Smtp-Source: APXvYqyHgoQxIz+VHCMjXbn/heNcdjrx+JMRzMs69GDuRcbxXUh0X9Yf5ohCMDBGY//DbK52dTE1sw==
X-Received: by 2002:a05:600c:2210:: with SMTP id z16mr10402529wml.57.1552087397755;
        Fri, 08 Mar 2019 15:23:17 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 12sm20103000wme.25.2019.03.08.15.23.16
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Mar 2019 15:23:16 -0800 (PST)
Subject: Re: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, linux-ide@vger.kernel.org,
        linux-nvme@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@fb.com>, Jens Axboe <axboe@kernel.dk>,
        Keith Busch <keith.busch@intel.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20190307000440.8708-1-marek.vasut@gmail.com>
 <7c051bbd-7835-9cab-30b2-0acde1364781@arm.com>
 <356f3ee8-407f-f865-e5cc-333695d4f857@gmail.com>
 <79e44e90-b16a-5315-e02f-101a2ebbb6a0@arm.com>
 <a8b5b75f-2660-e216-033a-77808e2afb76@gmail.com>
 <20190308071810.GA11959@lst.de>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <a6b34982-9100-0e60-c3eb-6ed8fcbe9e93@gmail.com>
Date:   Sat, 9 Mar 2019 00:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308071810.GA11959@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/8/19 8:18 AM, Christoph Hellwig wrote:
> On Thu, Mar 07, 2019 at 12:14:06PM +0100, Marek Vasut wrote:
>>> Right, but whoever *interprets* the device masks after the driver has
>>> overridden them should be taking the (smaller) bus mask into account as
>>> well, so the question is where is *that* not being done correctly?
>>
>> Do you have a hint where I should look for that ?
> 
> If this a 32-bit ARM platform it might the complete lack of support
> for bus_dma_mask in arch/arm/mm/dma-mapping.c..

It's an ARM 64bit platform, just the PCIe controller is limited to 32bit
address range, so the devices on the PCIe bus cannot read the host's
DRAM above the 32bit limit.

-- 
Best regards,
Marek Vasut
