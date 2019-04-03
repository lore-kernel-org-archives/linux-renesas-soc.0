Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD95DC10F06
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9096520830
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="YkEFfCYe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfDCJWp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:22:45 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35701 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbfDCJWo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:22:44 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EADBE25BDFF;
        Wed,  3 Apr 2019 20:22:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554283362; bh=j7dz/KzFMVuA2tE6qWZAQK1fiGUUEyl0Kv/KuJMrY0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YkEFfCYeDR/mSNR1cZBF6MyRVR0XJGRWzs9mr3wOenyXk7ul8MzGjeb563F3cXapR
         Db5eeuDSVSPesD8OfC+I7/kjRGegctutkywio5moAEVJ9e8c/DijuKp8raSDz2QCXZ
         PIOASIXTk0YSK4u//JMHUm7fYW1Z7ZkvzscvEWLk=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 08569940361; Wed,  3 Apr 2019 11:22:39 +0200 (CEST)
Date:   Wed, 3 Apr 2019 11:22:39 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT] thermal: rcar_gen3_thermal: Update calculation
 formula due to HW evaluation
Message-ID: <20190403092238.sy46nkpbhwo2izpa@verge.net.au>
References: <1553201273-16757-1-git-send-email-ykaneko0929@gmail.com>
 <20190401133753.5luent76gyzygtcb@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190401133753.5luent76gyzygtcb@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 01, 2019 at 03:37:57PM +0200, Simon Horman wrote:
> On Fri, Mar 22, 2019 at 05:47:53AM +0900, Yoshihiro Kaneko wrote:
> > From: Dien Pham <dien.pham.ry@renesas.com>
> > 
> > 1/ As evaluation of hardware team, temperature calculation formula
> >  of M3-W is difference from all other SoCs as below:
> >  - M3-W: Tj_1: 116 (so Tj_1 - Tj_3 = 157)
> >  - Others: Tj_1: 126 (so Tj_1 - Tj_3 = 167)
> > 
> > 2/ Update the formula to calculate CTEMP:
> >   Currently, the CTEMP is average of val1 (is calculated by
> >   formula 1) and val2 (is calculated by formula 2). But,
> >   as description in HWM (chapter 10A.3.1.1 Setting of Normal Mode)
> > 
> >   If (STEMP < Tj_T) CTEMP value should be val1.
> >   If (STEMP > Tj_T) CTEMP value should be val2.
> > 
> > 3/ Update the formula to calculate temperature:
> >   Currently, current TEMP is calculated as
> >   average of val1 (is calculated by formula 1)
> >   and val2 (is calculated by formula 2). But,
> >   as description in HWM (chapter 10A.3.1.2 Normal Mode.)
> > 
> >   If (TEMP_CODE < THCODE2[11:0]) CTEMP value should be val1.
> >   If (TEMP_CODE > THCODE2[11:0]) CTEMP value should be val2.
> > 
> > Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> > [ykaneko0929@gmail.com: use the data field of the of_device_id for Tj_1]
> > [ykaneko0929@gmail.com: revise a description of case 1 of the commit log]
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> I'm wondering if we could split this up into three patches,
> one for each problem it solves? Partly because I think it is good to fix
> one problem per patch. And partly because am having trouble
> verifying this patch - the new if statement in rcar_gen3_thermal_get_temp()
> seems to result in 0 temperature readings when the else case is used.
> 
> > ---
> >  drivers/thermal/rcar_gen3_thermal.c | 86 +++++++++++++++++++++++++------------
> >  1 file changed, 58 insertions(+), 28 deletions(-)
> > 
> > This patch is based on the master branch of Linus Torvalds's linux tree.
> > 
> > diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
> > index 88fa41c..de6f244 100644
> > --- a/drivers/thermal/rcar_gen3_thermal.c
> > +++ b/drivers/thermal/rcar_gen3_thermal.c
> > @@ -63,6 +63,15 @@
> >  
> >  #define TSC_MAX_NUM	3
> >  
> > +static int tj_2;
> 
> We need to avoid global variables. There can be multiple
> instances of this driver. (Although they will all get the same
> value for tj_2.
> 
> Perhaps it can be added to struct rcar_gen3_thermal_tsc?
> 
> ...

Also, from just a little further down the patch

> > +/* default THCODE values if FUSEs are missing */
> > +static int thcode[TSC_MAX_NUM][3] = {
> > +       { 3397, 2800, 2221 },
> > +       { 3393, 2795, 2216 },
> > +       { 3389, 2805, 2237 },
> > +};

I think thcode can be marked const.
