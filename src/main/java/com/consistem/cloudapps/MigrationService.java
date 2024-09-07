package com.consistem.cloudapps;

import org.flywaydb.core.Flyway;
import org.flywaydb.core.api.MigrationInfo;

import io.quarkus.logging.Log;
import io.quarkus.runtime.LaunchMode;
import io.quarkus.runtime.Startup;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;

@ApplicationScoped
public class MigrationService  {

    @Inject
    Flyway flyway;

    @Startup
    public void checkMigration() {

        Log.info("Flyway version -------- " + flyway.info().current().getVersion().toString());
        Log.info("Flyway LaunchMode ----- " + LaunchMode.current() );

        for( MigrationInfo flywayInfo : flyway.info().all() ) {
            Log.info("Flyway MigrationInfo ----- " + flywayInfo.getScript() + " - " + flywayInfo.getState() );
        }

    }
    
}
