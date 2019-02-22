Return-Path: <SRS0=c3Ds=Q5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CED6C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Feb 2019 15:06:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C1C32070B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Feb 2019 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550848003;
	bh=WQ5LeLa/Re3gGvmQoEd+xPNMyOFJfQUj53pof3OYXgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=FRabd5Pug6QaS8Hef5CYIPpuSK3Wz7uzk6rdEUT2zma6DAOD+ewQqkm3jLvV/aBX0
	 AsnT6YZKyl2W4j5IhF3RSoqNV/jSBkbVKk8Rbr7rqt7tcqnUIm2ncpBpqmC3S9Ru41
	 1TlwN/PZd6xZsTYJ7+4msOcucnyOkGbhk2CiA02U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727237AbfBVPGm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Feb 2019 10:06:42 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42743 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727215AbfBVPGm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Feb 2019 10:06:42 -0500
Received: by mail-ot1-f65.google.com with SMTP id i5so2073457oto.9;
        Fri, 22 Feb 2019 07:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0H+y6yUnAm5EJdGFGmLlgGBjZ7wOW4dSm2i1D82K/Qo=;
        b=A760XE4n/4fDmDSYt6miQGysC+gTbGHS8U8V+mHsVZtDlmz2XDlWxGPHRKj0bAt5vT
         ENNBqdNLb3ykIFJaXEHD729ayp6HXBhOdb+sjEQIGefrS1fVzQ4RwXTQZBShh5tKuP6I
         CYApDSYFjfI3BtG3eihqy1I4GId9TxG1NKVXjSbEIIZci1f+tNvRJZUQT4zSORdM2Sc+
         w5Atuvr9hDc3coziWaF2v1b+VAvgfCrmqUS6PoHdVeOzmfdYjj6u4rbrJo+bEdKChLQm
         GNWarRkPSxHtpmL8MpTbcywUdo7LyAqX0F2f6sWLC6a85e607L1eETVa+ikTTdnoeP+l
         IYOQ==
X-Gm-Message-State: AHQUAuZBbFbzrKqXYM7HjdmwXjRPM8snl2rDtI59mSX7oWDXp79o8h5A
        7ggkrGtzQ/W3Znt3zhA9xQ==
X-Google-Smtp-Source: AHgI3Ibo0G2JXzp3+5Lp94vRi8vxmzpE4IXqnRZeHC/b1kUCEU5rISWr1nIrwJw8DjBL7V/ykR+YaA==
X-Received: by 2002:a9d:7544:: with SMTP id b4mr2959881otl.326.1550848001025;
        Fri, 22 Feb 2019 07:06:41 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 124sm639561oia.55.2019.02.22.07.06.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Feb 2019 07:06:40 -0800 (PST)
Date:   Fri, 22 Feb 2019 09:06:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
Message-ID: <20190222150639.GA19921@bogus>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 04:10:58PM +0000, Gareth Williams wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The driver requires an undocumented clock property, so detail it.
> Add documentation for a separate, optional, peripheral clock.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> v4:
>  - Updated commit message to reference "peripheral clock" instead of 
>    "bus clock" 
>  - Added Wolfram's Acked-by
> v3:
>  - Changed clocks and clock-names sections to use term "peripheral clock"
>    (pclk) instead of "bus clock" (busclk).
> v2:
>  - No changes.
> v1:
>  - Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-designware.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
