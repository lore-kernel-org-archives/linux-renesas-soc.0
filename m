Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38222 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751803AbeDJJdp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 05:33:45 -0400
Date: Tue, 10 Apr 2018 11:33:41 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 4/4] usb: gadget: udc: renesas_usb3: should call
 devm_phy_get() before add udc
Message-ID: <20180410093341.fbcnvldnqvqaxihn@verge.net.au>
References: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1522671694-10229-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20180409115826.xrsdg3khgs7opgzh@verge.net.au>
 <TY1PR06MB0992AEE222845F446D4EB763D8BE0@TY1PR06MB0992.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB0992AEE222845F446D4EB763D8BE0@TY1PR06MB0992.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 10, 2018 at 01:28:33AM +0000, Yoshihiro Shimoda wrote:
> Hi Simon-san,
> 
> > From: Simon Horman, Sent: Monday, April 9, 2018 8:58 PM
> > 
> > On Mon, Apr 02, 2018 at 09:21:34PM +0900, Yoshihiro Shimoda wrote:
> > > This patch fixes an issue that this driver cannot call phy_init()
> > > if a gadget driver is alreadly loaded because usb_add_gadget_udc()
> > > might call renesas_usb3_start() via .udc_start.
> > >
> > > Fixes: 279d4bc64060 ("usb: gadget: udc: renesas_usb3: add support for generic phy")
> > > Cc: <stable@vger.kernel.org> # v4.15+
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >  drivers/usb/gadget/udc/renesas_usb3.c | 16 ++++++++--------
> > >  1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > 
> > Please see some suggestions for follow-up lower-priority patches below.
> 
> Thank you for the review and suggestions!
> 
> > >
> > > diff --git a/drivers/usb/gadget/udc/renesas_usb3.c b/drivers/usb/gadget/udc/renesas_usb3.c
> > > index 738b734..671bac3 100644
> > > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > > @@ -2632,6 +2632,14 @@ static int renesas_usb3_probe(struct platform_device *pdev)
> > >  	if (ret < 0)
> > >  		goto err_alloc_prd;
> > >
> > > +	/*
> > > +	 * This is an optional. So, if this driver cannot get a phy,
> > > +	 * this driver will not handle a phy anymore.
> > > +	 */
> > 
> > nit: s/an optional/optional/
> 
> Oops. I will fix and submit v2 patches.
> 
> > > +	usb3->phy = devm_phy_get(&pdev->dev, "usb");
> > > +	if (IS_ERR(usb3->phy))
> > > +		usb3->phy = NULL;
> > 
> > I think this will unintentionally ignore errors other than the
> > non-existence of the device, f.e. a memory allocation failure
> > in devm_phy_get().
> > 
> > So perhaps something like this, as per phy_optional_get(), would be better?
> > 
> > 	usb3->phy = devm_phy_get(&pdev->dev, "usb");
> > 	if (IS_ERR(usb3->phy) && (PTR_ERR(usb3->phy) == -ENODEV))
> > 		usb3->phy = NULL;
> 
> Thank you for the suggestion. I agree with you.
> I think I should use devm_phy_optional_get() instead of dev_phy_get(), as you mentioned :)
> So, I will fix the code by using devm_phy_optional_get() first, and then fix this.

Thanks, I agree that would be a good fix.

But perhaps it is better as a follow-up?
