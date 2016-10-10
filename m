Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35464 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751056AbcJJKLp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 06:11:45 -0400
Received: by mail-lf0-f43.google.com with SMTP id l131so116056852lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Oct 2016 03:11:44 -0700 (PDT)
Date: Mon, 10 Oct 2016 12:11:40 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        Karl Auer <kauer@biplane.com.au>
Subject: Re: About Kernel codes
Message-ID: <20161010101140.GB18151@bigcity.dyn.berto.se>
References: <SG2PR0401MB12967580C2EFC09AB1244F1BD8DB0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SG2PR0401MB12967580C2EFC09AB1244F1BD8DB0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jithin,

On 2016-10-10 09:07:35 +0000, Jithin T Raj wrote:
> Hi all,
> �I am always stuck with the declaration or ports in kernel code...
> 
> 
> &du{
> -----------------
> ------------------ bla bla....
> 
> 
> ports {
> �� ��� �port@1 {
> �� ��� ��� �endpoint {
> �� ��� ��� ��� �remote-endpoint = <&adv7123_in>;
> �� ��� ��� �};
> �� ��� �};
> �� �};};
> 
> In my knowledge I understand that here display unit has one� port(port1) which is for
> vga encoder IC input signal..is it?and I am eager to know where these ports are defined in tree(In case of Koelsche,Alt,Lager etc) and am I able to change the port number..I mean,can I give above as port@0 instead of port@1..and �also how can I add another ports here??
> 
> Hopping for your comments

You can find the port node information for the different boards in the 
Documentation directory in your kernel tree:

Documentation/devicetree/bindings/display/renesas,du.txt

-- 
Regards,
Niklas S�derlund
