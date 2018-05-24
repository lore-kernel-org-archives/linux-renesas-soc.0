Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr10094.outbound.protection.outlook.com ([40.107.1.94]:10917
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S966668AbeEXLy0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 May 2018 07:54:26 -0400
Subject: Re: [PATCH v2 1/2] i2c: mux: demux-pinctrl: use proper parent device
 for demux adapter
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180521072939.2836-1-wsa+renesas@sang-engineering.com>
 <20180521072939.2836-2-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <f4b089c2-e0bc-b3d2-9290-f48fa262980a@axentia.se>
Date: Thu, 24 May 2018 13:54:19 +0200
MIME-Version: 1.0
In-Reply-To: <20180521072939.2836-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-05-21 09:29, Wolfram Sang wrote:
> Due to a typo, the wrong parent device was assigned to the newly created
> demuxing adapter device. It got connected to the demuxing platform
> device but not to the selected parent I2C adapter device. Fix it to get
> a proper parent-child relationship of the demuxed busses.

Applied to i2c-mux/for-next.

Cheers,
Peter
