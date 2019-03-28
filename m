Return-Path: <SRS0=Kbds=R7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C95C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 15:33:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67F2F2183E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Mar 2019 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1553787236;
	bh=wSwHScFji/I2uzw/0dKpVMOqwA7vsYQ8HeBlttD2p9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gLe0mz9Afuzx7IGvhowCs4Epw296WSQAm6EgFMmawPK72IFb00o3ihp+hPdwrANqW
	 P90MGsY+vK5ftdBRXbcUTOMjoBbY0XiRG77rPrNIwTck/GLqr0MWf8OGI+9nY3olQ+
	 eYBr/A75FjFkI5UHwDlwFXqVkiF0W7VR438Qifp0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfC1Pd4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Mar 2019 11:33:56 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45462 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfC1Pdz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Mar 2019 11:33:55 -0400
Received: by mail-ot1-f66.google.com with SMTP id e5so18684661otk.12;
        Thu, 28 Mar 2019 08:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kkjST5d+zMO2FWJ6UN8l/ext2oun8SHH/1+mIfkgrHU=;
        b=B0EkIRoS4Oh6NtR/prA5uIhYrZSDmEbF3/yES1K6TyRhvIfYQbWKuI2ZA6ka1vbyWD
         xrMe6qdyiuH8xEkxW137Iwm7Sv91LlQiYFECDCBoQmD/SpHdfPrran7+owHZVEeUsNI9
         FM81CKeEcgBXqr29ct62shX68hAF3JNWdV4ZaRoos8qONCRrHPTl3sAkyMF6d6L/UgWc
         /b16RG/00VQRiwnY2/4pbDanvAq4LGdzOpFKEk6FxI4pYLkpodJBOt/eM6IBuPBNJQUe
         CTP/zQHMvCEeQYyo20+Wx+Vf/luhXzdSkj9Lwit467wqFEyzIv7ub5jvB++yu6e0lN2M
         2GHg==
X-Gm-Message-State: APjAAAUbbFo6KCF8Fk8KTcVp6pXgqWY002rCZah8YH5tY+OGnr3fnQBw
        Hc34Xphuae245txkCSJc1A==
X-Google-Smtp-Source: APXvYqzpitg53Rm1paO16vKhlsTFNdG8qLRi90w/uiDObSMQ19F24mPuGsutqU5H1CBTBs1qII8dLA==
X-Received: by 2002:a9d:ef4:: with SMTP id 107mr31459324otj.152.1553787234949;
        Thu, 28 Mar 2019 08:33:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j1sm7236430otn.59.2019.03.28.08.33.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2019 08:33:54 -0700 (PDT)
Date:   Thu, 28 Mar 2019 10:33:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add
 usb-role-switch property
Message-ID: <20190328153353.GA3070@bogus>
References: <1552552775-51667-1-git-send-email-biju.das@bp.renesas.com>
 <1552552775-51667-3-git-send-email-biju.das@bp.renesas.com>
 <TY2PR01MB4812BACA4673786E867C253FD84B0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <OSBPR01MB21039B4241097B8EE8C73A85B84B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190314105347.GC7752@kuha.fi.intel.com>
 <OSBPR01MB2103DDDD7A426E79259723FEB8440@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20190315105146.GI7752@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190315105146.GI7752@kuha.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 15, 2019 at 12:51:46PM +0200, Heikki Krogerus wrote:
> Thanks,
> 
> On Fri, Mar 15, 2019 at 09:08:19AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v2 2/7] dt-bindings: usb: renesas_usb3: add usb-role-
> > > > > > a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > index 35039e7..eecaf4c 100644
> > > > > > --- a/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > +++ b/Documentation/devicetree/bindings/usb/renesas_usb3.txt
> > > > > > @@ -22,6 +22,7 @@ Required properties:
> > > > > >  Optional properties:
> > > > > >    - phys: phandle + phy specifier pair
> > > > > >    - phy-names: must be "usb"
> > > > > > +  - usb-role-switch: use USB role switch to support dual-role
> > > > > > + switch
> > > > >
> > > > > I don't think we can add such a property. At least, we have to add
> > > "renesas,"
> > > > > prefix.
> > > >
> > > > usb_role_switch_get   api uses  "usb-role-switch"  property to get role
> > > switch linked with the device.
> > > >
> > > > HD3SS3220 port controller driver gets role switch handle linked with the
> > > device using usb_role_switch_get  api.
> > > > That is the reason, I have added " usb-role-switch" property here.
> > > >
> > > > Do you have any other suggestion to get usb role switch handle?
> > > 
> > > We can still change the API. Can we use the compatible for this?
> > 
> > Do you mean usb_role_switch_get  API needs  to handle compatible "usb-x-connector"  wherex= a,b ,c ?
> > Then it uses the graphs api to get the device linked with it and return the usb role switch handle.
> > In that case, no need to add  generic "usb-role-switch"  property here.
> > 
> > Can you please confirm my understanding is correct?
> 
> No, I meant the compatible property would have the value
> "usb-role-switch". Your compatible would probable look something
> like this:
> 
>         compatible = "renesas,r8a774c0-usb3-peri",
>                      "usb-role-switch";
> 
> So the idea would be that the device supplying USB role switch
> functionality, in your case the USB controller, would need to have the
> compatible property containing "usb-role-switch".

That's not really something a driver could bind to nor provides any info 
as to what the h/w is (and how to interact with it).

> 
> I'm really not an expert in DT, so I don't know if that is acceptable.
> Rob can you comment on this?

I would go with Biju's proposal.

Rob
