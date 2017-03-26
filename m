Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Sun, 26 Mar 2017 11:01:52 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.com>
Subject: Re: [PATCH 0/2] Move uart_register_driver call to device probe for
 pl010 and sh-sci
Message-ID: <20170326100152.GN7909@n2100.armlinux.org.uk>
References: <20170324162634.8880-1-sjoerd.simons@collabora.co.uk>
 <20170324164202.GI7909@n2100.armlinux.org.uk>
 <CAMuHMdUkfzJw6W0jQZPChN+Uqb0Ewkn86o0Pzd+9+Wi1-XZRAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUkfzJw6W0jQZPChN+Uqb0Ewkn86o0Pzd+9+Wi1-XZRAw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Mar 26, 2017 at 11:22:57AM +0200, Geert Uytterhoeven wrote:
> Time for the serial subsystem to switch to dynamic minors, and get rid of the
> what-is-your-serial-port-called-again-on-this-platform
> multi-million-euro question?

Dynamic device numbers are fine for those who use devtmpfs / udev, but I
would imagine that there are systems out there which don't, and if they
change, systems become inaccessible (the port becomes dead, even to
sysrq.)

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
