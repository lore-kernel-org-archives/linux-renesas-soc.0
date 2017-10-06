Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52502 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751518AbdJFJ0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 05:26:16 -0400
Date: Fri, 6 Oct 2017 11:26:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: host: xhci-plat: Use of_device_get_match_data()
 helper
Message-ID: <20171006092606.GH7734@verge.net.au>
References: <1507119903-13148-1-git-send-email-geert+renesas@glider.be>
 <20171005091916.GR26369@verge.net.au>
 <59D60571.40101@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59D60571.40101@intel.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 05, 2017 at 01:12:01PM +0300, Mathias Nyman wrote:
> On 05.10.2017 12:19, Simon Horman wrote:
> >On Wed, Oct 04, 2017 at 02:25:03PM +0200, Geert Uytterhoeven wrote:
> >>Use the of_device_get_match_data() helper instead of open coding.
> >>
> >>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> >Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> >
> 
> Thanks, I already applied and sent forward before this new reviewed-by tag

Thanks, sorry for not noticing that.
