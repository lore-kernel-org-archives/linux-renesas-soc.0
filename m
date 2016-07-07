Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58148 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030536AbcGGIdR (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 7 Jul 2016 04:33:17 -0400
Date: Thu, 7 Jul 2016 10:33:08 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
cc: intel-gfx@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ti.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	=?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	=?ISO-8859-15?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>,
	Jens Frederich <jfrederich@gmail.com>,
	Daniel Drake <dsd@laptop.org>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Milo Kim <milo.kim@ti.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Paul Mackerras <paulus@samba.org>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Antonino Daplas <adaplas@gmail.com>,
	linux-acpi@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] backlight: Avoid double fbcon backlight handling
In-Reply-To: <1467286256-8870-1-git-send-email-chris@chris-wilson.co.uk>
Message-ID: <alpine.LNX.2.00.1607071032280.24757@cbobk.fhfr.pm>
References: <1467286256-8870-1-git-send-email-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 30 Jun 2016, Chris Wilson wrote:

> Backlights controlled by i915.ko and only associated with its connectors
> and also only associated with the intel_drmfb fbcon, controlled by
> i915.ko. In this situation, we already handle adjusting the backlight
> when the fbcon is blanked/unblanked and do not require backlight trying
> to do the same.
> 
> Attempting to register with the fbdev as a client causes lockdep to warn
> about a dependency cycle:
[ ... snip ... ]
>  drivers/hid/hid-picolcd_backlight.c                  |  3 ++-

For this one:

	Acked-by: Jiri Kosina <jkosina@suse.cz>

-- 
Jiri Kosina
SUSE Labs
