Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:45442 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751279AbeDXOky (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 10:40:54 -0400
Received: by mail-lf0-f66.google.com with SMTP id q5-v6so20673295lff.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Apr 2018 07:40:53 -0700 (PDT)
Date: Tue, 24 Apr 2018 16:40:51 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: update register
 size in example
Message-ID: <20180424144051.GD27674@bigcity.dyn.berto.se>
References: <20180417204958.14723-1-niklas.soderlund@ragnatech.se>
 <20180424142841.ausmjp3k5tjwyi6g@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180424142841.ausmjp3k5tjwyi6g@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Rob,

On 2018-04-24 09:28:41 -0500, Rob Herring wrote:
> On Tue, Apr 17, 2018 at 10:49:58PM +0200, Niklas S�derlund wrote:
> > From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > The datasheet have been expanded with more registers and the DT files
> > have been updated with the new size. This change updates the example so
> > writing new DT files can use the enchanted driver which uses the new
> > registers.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../devicetree/bindings/thermal/rcar-gen3-thermal.txt       | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Applied with Simon's comments addressed.

Thanks for addressing Simon's comments while applying. I had planed to 
repost the thermal patches I got comments for later today so this is one 
less thing for me to do :-)

> 
> Rob

-- 
Regards,
Niklas S�derlund
