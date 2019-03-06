Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279ECC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:43:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 015F0204EC
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 12:43:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730125AbfCFMnG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 07:43:06 -0500
Received: from mga05.intel.com ([192.55.52.43]:17222 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728734AbfCFMnF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 07:43:05 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2019 04:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,447,1544515200"; 
   d="scan'208";a="152537874"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 06 Mar 2019 04:43:01 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 06 Mar 2019 14:43:01 +0200
Date:   Wed, 6 Mar 2019 14:43:01 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kees Cook <keescook@chromium.org>, linux-usb@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/9] usb: gadget: udc: renesas_usb3: use extcon framework
 to receive connect/disconnect
Message-ID: <20190306124301.GB28103@kuha.fi.intel.com>
References: <1551863246-11656-1-git-send-email-biju.das@bp.renesas.com>
 <1551863246-11656-5-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1551863246-11656-5-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 06, 2019 at 09:07:21AM +0000, Biju Das wrote:
> RZ/G2E cat874 board is capable of detecting cable connect and disconnect
> events. Add support for renesas_usb3 to receive connect and disconnect
> notification using extcon framework.

I think you will need the series from Yu Chen [1], but once we have
that, you can do this with USB role class instead of relying on
extcon, and that is what you need to do.

There is a reason why we need to use a dedicated class with the USB
role switching instead of relying on extcon. We actually originally
planned on using extcon with the USB role switches, but the extcon
maintainers refused some the USB mux drivers. The problem from extcon
perspective is that the consumer/supplier roles seem to be inverted in
some cases. USB role switch can simply be too many things - discrete
mux, integrated mux (like in your case) or something like a dual role
capable USB controller could simply represent one.

On the other hand, using a dedicated API and class now feel like a
much better idea in general compared to a multipurpose thing like
extcon.

[1] https://lkml.org/lkml/2019/3/2/42

thanks,

-- 
heikki
