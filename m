Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:46504 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753989AbeCRMsP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Mar 2018 08:48:15 -0400
Date: Sun, 18 Mar 2018 07:48:13 -0500
From: Rob Herring <robh@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: thierry.reding@gmail.com, mark.rutland@arm.com,
        linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: renesas,pwm-rcar: add bindings for
 R-Car M3N support
Message-ID: <20180318124813.6arthsa6rpvbcquy@rob-hp-laptop>
References: <1520596397-4716-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520596397-4716-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 09, 2018 at 08:53:17PM +0900, Yoshihiro Shimoda wrote:
> This patch adds bindings for R-Car M3N. No driver update is needed.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
