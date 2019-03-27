Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B89C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 13:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64B8D21734
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553692006;
	bh=E0liOdubiccWd4jUYz0WTmCqryO/xUq9WkYiL2KxGn8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-ID:From;
	b=hWIQLijTDV82k2YXtlaWT3O3ybGwxCd5a8P91RyCL5+kNrgwLxwhVoEIAU7aspikT
	 fOPIlsjvQK1ZRXB057KO5AMSGNOh8PJSEcWdwP2RvY9eNSL/383kcYJqBYav8CVsVy
	 qdsQ94o3/IOVz48E/vTFwX/bG+NgsVwITWOUGL+g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728184AbfC0NGq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 09:06:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:33932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728101AbfC0NGp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 09:06:45 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 962FF206DF;
        Wed, 27 Mar 2019 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1553692005;
        bh=E0liOdubiccWd4jUYz0WTmCqryO/xUq9WkYiL2KxGn8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=nlVvXshvmp+ws/Vc/rfpiiU8mRYKkUZEsjH/q+xNtXsJvACaaYBH0wYPjfQp9w+og
         P0c36kVZXNpQHkxo2HNFpBY8Bl0/OpqcCETnQJATFgMYUSLN0Vs4xSaeP8YS55ABu2
         1ZM2qH8rQ99OBwB/TWvfMpDJmHUTAZi4P2rDDf1M=
Date:   Wed, 27 Mar 2019 14:06:40 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH 1/1] hid: hid-sensor-custom: simplify getting
 .driver_data
In-Reply-To: <20190319163638.31003-1-wsa+renesas@sang-engineering.com>
Message-ID: <nycvar.YFH.7.76.1903271406260.19912@cbobk.fhfr.pm>
References: <20190319163638.31003-1-wsa+renesas@sang-engineering.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 Mar 2019, Wolfram Sang wrote:

> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-5.2/sensor, thanks.

-- 
Jiri Kosina
SUSE Labs

