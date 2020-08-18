Return-Path: <SRS0=zzKo=B4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB762C433E1
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Aug 2020 11:59:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C31D4206B5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Aug 2020 11:59:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgHRL7m (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Aug 2020 07:59:42 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:43829 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgHRL7l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 07:59:41 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 168671C000B;
        Tue, 18 Aug 2020 11:59:36 +0000 (UTC)
Date:   Tue, 18 Aug 2020 14:03:19 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        hverkuil@xs4all.nl, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 1/4] media: i2c: max9286: Initialize try formats
Message-ID: <20200818120319.rrw6wwabrr275zln@uno.localdomain>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
 <20200817143540.247340-2-jacopo+renesas@jmondi.org>
 <20200818070910.GC7145@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200818070910.GC7145@valkosipuli.retiisi.org.uk>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sakari,

On Tue, Aug 18, 2020 at 10:09:10AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Mon, Aug 17, 2020 at 04:35:37PM +0200, Jacopo Mondi wrote:
> > Initialize try formats at device node open time by querying the
> > format from the remote subdevices instead of hard-coding it.
>
> The try formats are expected to be device defaults and not dependent on
> configuration.
>

The deserializer defaul depends on what is serialized on the other
end. I think getting it from the remote end makes sense in this case.

Thanks
   j

> --
> Sakari Ailus
